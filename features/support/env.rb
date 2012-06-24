ENV['RACK_ENV'] = 'test'

require_relative '../../lib/tc'

require 'tempfile'
require 'gli_interface'

require 'aruba/cucumber'
ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
