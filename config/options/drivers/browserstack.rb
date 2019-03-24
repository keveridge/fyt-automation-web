require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'browserstack/local'

# monkey patch to avoid reset sessions
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    @browser.navigate.to('about:blank') if @browser
  end
end

TASK_ID = (ENV['BROWSERSTACK_TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['BROWSERSTACK_CONFIG_NAME'] || 'windows.10.chrome'

CONFIG = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), "browserstack/#{CONFIG_NAME}.config.yml")))

USERNAME_VAR = 'BROWSERSTACK_USERNAME'
ACCESS_KEY_VAR = 'BROWSERSTACK_ACCESS_KEY'

# Check for creds
raise "The environment variable `#{USERNAME_VAR}` is not defined" unless ENV.has_key?(USERNAME_VAR)
raise "The environment variable `#{ACCESS_KEY_VAR}` is not defined" unless ENV.has_key?(ACCESS_KEY_VAR)

CONFIG['user'] = ENV[USERNAME_VAR]
CONFIG['key'] = ENV[ACCESS_KEY_VAR]

Capybara.register_driver :browserstack do |app|
  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

  # Code to start browserstack local before start of test
  if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true'
    @bs_local = BrowserStack::Local.new
    bs_local_args = { 'key' => (CONFIG['key']).to_s }
    @bs_local.start(bs_local_args)
  end

  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 url: "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
                                 desired_capabilities: @caps)
end

Capybara.default_driver = :browserstack
Capybara.run_server = false
Capybara.app_host = ConfigData.base_url

# Code to stop browserstack local after end of test
at_exit do
  @bs_local.stop unless @bs_local.nil?
end

# Resize the window to maximum
Before do
  Capybara.page.driver.browser.manage.window.maximize
end