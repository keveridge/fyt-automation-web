require 'yaml'
require 'selenium/webdriver'
require 'capybara/cucumber'


Capybara.register_driver :lamdatest do |app|

  # Default capabilities
  @caps = ConfigData.default_caps

  CONFIG['caps'].keys.each do |cap|
    @caps[cap] = CONFIG['caps'][cap] # Add caps from the config file
  end

  @driver = ConfigData.selenium_driver(app:app, username:ENV[USERNAME_VAR], access_key:ENV[ACCESS_KEY_VAR], caps:@caps)
end

ConfigData.config_capybara(default_driver: :lamdatest)
