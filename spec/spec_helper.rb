$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
end