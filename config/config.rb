# Define constants
BASE_DIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))

# Define the directories of variables to scan for Ruby files and load
['step_definitions'].each do |dir|
  dir = File.join(BASE_DIR, dir)
  Dir.glob(File.join(dir, '**', '*.rb'), &method(:require))
  $LOAD_PATH.unshift(dir)
end