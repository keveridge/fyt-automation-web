require_relative '../../../config/configdata'
require 'capybara'
require 'capybara/cucumber'                   # Capybara Cucumber support
require 'selenium/webdriver'
require 'chromedriver/helper'
require 'prettyprint'

# Create an instance of Capybara
Capybara.register_driver :chrome do |app|

  if CONFIG.include? 'caps'
    Capybara::Selenium::Driver.new(app,
                                  browser: :chrome,
                                  desired_capabilities: CONFIG['caps'])
  else
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome)
  end
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.app_host = ConfigData.base_url