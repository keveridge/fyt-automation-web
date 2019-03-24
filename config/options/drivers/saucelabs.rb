require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'prettyprint'
require 'sauce_whisk'

CONFIG_NAME = ENV['SAUCELABS_CONFIG_NAME'] || 'windows.10.chrome'

CONFIG = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), "saucelabs/#{CONFIG_NAME}.config.yml")))

USERNAME_VAR = 'SAUCELABS_USERNAME'
ACCESS_KEY_VAR = 'SAUCELABS_ACCESS_KEY'

# Check for creds
raise "The environment variable `#{USERNAME_VAR}` is not defined" unless ENV.has_key?(USERNAME_VAR)
raise "The environment variable `#{ACCESS_KEY_VAR}` is not defined" unless ENV.has_key?(ACCESS_KEY_VAR)

Capybara.register_driver :sauce do |app|

  caps_base = {
            :platform=>:any,
            :javascript_enabled=>true,
            :css_selectors_enabled=>true,
            :takes_screenshot=>true,
            :native_events=>false,
            :rotatable=>false,
  }

  @caps = Selenium::WebDriver::Remote::Capabilities.send(CONFIG['browser'])

  CONFIG['caps'].keys.each { |cap| @caps[cap] = CONFIG['caps'][cap] } # Add caps from the config file

  @caps['username'] = ENV[USERNAME_VAR]
  @caps['accessKey'] = ENV[ACCESS_KEY_VAR]

  #pp @caps

  @driver = Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 url: 'https://ondemand.saucelabs.com:443/wd/hub',
                                 desired_capabilities: @caps)
end

Capybara.default_driver = :sauce
Capybara.run_server = false
Capybara.app_host = ConfigData.base_url

# Resize the window to maximum
Before do
  Capybara.page.driver.browser.manage.window.maximize
end