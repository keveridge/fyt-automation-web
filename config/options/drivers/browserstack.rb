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

CONFIG['user'] = ENV[USERNAME_VAR]
CONFIG['key'] = ENV[ACCESS_KEY_VAR]

Capybara.register_driver :browserstack do |app|

  @caps = ConfigData.default_caps

  CONFIG['caps'].keys.each do |cap|
    @caps[cap] = CONFIG['caps'][cap] # Add caps from the config file
  end

  # Code to start browserstack local before start of test
  if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true'
    @bs_local = BrowserStack::Local.new
    bs_local_args = { 'key' => (CONFIG['key']).to_s }
    @bs_local.start(bs_local_args)
  end

  @driver = ConfigData.selenium_driver(app:app, username:ENV[USERNAME_VAR], access_key:ENV[ACCESS_KEY_VAR], caps:@caps)
end

# Code to stop browserstack local after end of test
at_exit do
  @bs_local.stop unless @bs_local.nil?
end

ConfigData.config_capybara(default_driver: :browserstack)