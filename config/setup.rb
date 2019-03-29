require_relative 'hooks'
require_relative 'configdata'
require 'rspec'                         # Framework for test expectations
require 'pry-byebug'                    # A runtime interactive debugging tool
require 'capybara/cucumber'                   # Capybara Cucumber support
require 'selenium/webdriver'
require 'prettyprint'
require 'text-table'

if ![:appium, :local].include?(ConfigData.driver.to_sym)

  USERNAME_VAR = "#{ConfigData.driver.upcase}_USERNAME"
  ACCESS_KEY_VAR = "#{ConfigData.driver.upcase}_ACCESS_KEY"

  # Check for creds
  raise "The environment variable `#{USERNAME_VAR}` is not defined" unless ENV.has_key?(USERNAME_VAR)
  raise "The environment variable `#{ACCESS_KEY_VAR}` is not defined" unless ENV.has_key?(ACCESS_KEY_VAR)
end

default_config = (ConfigData.driver.to_sym == :local) ? 'local' : 'windows.10.chrome'
CONFIG_NAME = ENV["#{ConfigData.driver.upcase}_CONFIG_NAME"] || default_config # Load the browser config

CONFIG = YAML.safe_load( # Load the browser and OS configuration for the remote driver
    File.read(
        File.join(
            File.dirname(__FILE__), "options/drivers/#{ConfigData.driver.downcase}/#{CONFIG_NAME}.config.yml")
    )
)

require_relative ConfigData.driver_file # Run individual remote driver setup code


AfterConfiguration do |config|
  if config.formats.to_s.include? 'pretty' # If this is the pretty print format, output the configuration
    puts [
             ['Profiles:', config.profiles.first],
             ['Driver:', ConfigData.driver],
             ['Device:', CONFIG_NAME],
             ['Breakpoint:', ConfigData.breakpoint(config:CONFIG)],
             ['Environment:', ConfigData.environment],
             ['Tags:', config.tag_expressions.join(', ')]
    ].to_table
  end
end

# Define constants
BASE_DIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
IS_MOBILE = ConfigData.is_mobile?(config:CONFIG)
IS_REMOTE = ConfigData.is_remote?

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

