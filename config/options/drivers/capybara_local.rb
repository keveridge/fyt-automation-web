require_relative '../../../config/configdata'
require 'capybara/cucumber'                   # Capybara Cucumber support
require 'selenium/webdriver'
require 'pp'

caps = Selenium::WebDriver::Remote::Capabilities.firefox()
caps['platform'] = 'Windows 10'
caps['version'] = '35.0'

binding.pry


# Create an instance of Capybara
Capybara.register_driver :chrome do |driver, path|
  opts = {
      :browser => :chrome
  }
  Capybara::Selenium::Driver.new(driver, opts)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.app_host = ConfigData.base_url