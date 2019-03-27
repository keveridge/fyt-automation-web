require 'rspec'                         # Framework for test expectations
require 'pry-byebug'                    # A runtime interactive debugging tool
require_relative 'hooks'
require_relative 'configdata'

if ConfigData.driver.to_sym != :local # Only run for selenium grid / remote providers

  CONFIG_NAME = ENV["#{ConfigData.driver.upcase}_CONFIG_NAME"] || 'windows.10.chrome' # Load the browser config
  CONFIG = YAML.safe_load( # Load the browser and OS configuration for the remote driver
            File.read(
                File.join(
                    File.dirname(__FILE__), "options/drivers/#{ConfigData.driver.downcase}/#{CONFIG_NAME}.config.yml")
            )
          )

  USERNAME_VAR = "#{ConfigData.driver.upcase}_USERNAME"
  ACCESS_KEY_VAR = "#{ConfigData.driver.upcase}_ACCESS_KEY"

  # Check for creds
  raise "The environment variable `#{USERNAME_VAR}` is not defined" unless ENV.has_key?(USERNAME_VAR)
  raise "The environment variable `#{ACCESS_KEY_VAR}` is not defined" unless ENV.has_key?(ACCESS_KEY_VAR)

end

require_relative ConfigData.driver_file # Run individual remote driver setup code

# Define constants
BASE_DIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
IS_MOBILE = (ENV.has_key?('FYT_MOBILE') && ENV['FYT_MOBILE'] == 'true') ? true : false
IS_REMOTE = (ConfigData.driver.to_sym != :local) ? true : false

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

