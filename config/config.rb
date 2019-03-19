require 'capybara/cucumber'             # Capybara Cucumber support
require 'rspec'                         # Framework for test expectations
require 'pry-byebug'                    # A runtime interactive debugging tool
require_relative 'hooks'

# Define constants
BASE_DIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))

# Define the directories of variables to scan for Ruby files and load
[
    'page_objects',
    'step_definitions',
    'support'
].each do |dir|
  dir = File.join(BASE_DIR, dir)
  Dir.glob(File.join(dir, '**', '*.rb'), &method(:require))
  $LOAD_PATH.unshift(dir)
end

# Create an instance of Capybara
Capybara.register_driver :chrome do |driver, path|
   opts = {
       :browser => :chrome
   }
   Capybara::Selenium::Driver.new(driver, opts)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.app_host = TestData.base_url