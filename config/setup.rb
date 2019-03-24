require 'rspec'                         # Framework for test expectations
require 'pry-byebug'                    # A runtime interactive debugging tool
require_relative 'hooks'
require_relative 'configdata'
require_relative ConfigData.driver_file

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

