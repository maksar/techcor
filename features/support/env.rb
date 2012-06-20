ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'aruba/cucumber'
ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

require 'hirb'

require_relative '../../lib/tc'