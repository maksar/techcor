ENV['RACK_ENV'] = 'test'

require 'mongoid-rspec'
RSpec.configure do |configuration|
  configuration.include Mongoid::Matchers
end

require_relative '../lib/tc'