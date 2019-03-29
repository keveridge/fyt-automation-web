require_relative '../../../config/configdata'
require 'capybara/cucumber'                   # Capybara Cucumber support
require 'selenium/webdriver'
require 'appium_capybara'


desired_caps_ios = {
    deviceName:      "iPad Pro (11-inch)",
    platformName:    "iOS",
    platformVersion: "12.1",
    browserName:     "Safari",
    orientation:     "LANDSCAPE"
}

url = "http://localhost:4723/wd/hub" # or a sauce labs url

Capybara.register_driver(:appium) do |app|
  appium_lib_options = {
      server_url:           url
  }
  all_options = {
      appium_lib:  appium_lib_options,
      caps:        desired_caps_ios
  }
  Appium::Capybara::Driver.new app, all_options
end

Capybara.javascript_driver = :appium
Capybara.default_driver = :appium

Capybara.app_host = ConfigData.base_url