require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'
require 'prettyprint'
require 'sauce_whisk'

Capybara.register_driver :sauce do |app|

  caps_base = ConfigData.default_caps

  @caps = Selenium::WebDriver::Remote::Capabilities.send(CONFIG['browser'])

  CONFIG['caps'].keys.each { |cap| @caps[cap] = CONFIG['caps'][cap] } # Add caps from the config file

  @caps['username'] = ENV[USERNAME_VAR]
  @caps['accessKey'] = ENV[ACCESS_KEY_VAR]

  @driver = ConfigData.selenium_driver(app:app, username:ENV[USERNAME_VAR], access_key:ENV[ACCESS_KEY_VAR], caps:@caps)
end

ConfigData.config_capybara(default_driver: :sauce)
