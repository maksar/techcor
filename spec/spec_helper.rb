$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

require 'bundler'
Bundler.require

require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
end

require 'mongoid-rspec'
RSpec.configure do |configuration|
  configuration.include Mongoid::Matchers
end

ENV["RACK_ENV"] = 'test'
Mongoid.load!("config/mongoid.yml")
