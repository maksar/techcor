$LOAD_PATH.unshift(File.expand_path('../', File.dirname(__FILE__)))

ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

RSpec.configure do |configuration|
  configuration.include Mongoid::Matchers
end

Mongoid.load!("config/mongoid.yml")
