require_relative '../../../config/configdata'
require 'capybara/cucumber'                   # Capybara Cucumber support
require 'selenium/webdriver'

# Create an instance of Capybara
Capybara.register_driver :chrome do |driver, path|
  opts = {
      :browser => :chrome
  }
  @driver = Capybara::Selenium::Driver.new(driver, opts)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.app_host = ConfigData.base_url