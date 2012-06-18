ENV['RACK_ENV'] = 'test'
require 'mongoid'
Mongoid.load!("config/mongoid.yml")

require 'mongoid-rspec'
RSpec.configure do |configuration|
  configuration.include Mongoid::Matchers
end

require 'project'
require 'property_value'
require 'project_catalog'
require 'console_formatter'
require 'metrics/metric'
require 'metrics/number_metric'
require 'metrics/string_metric'
require 'commands/list_projects'
require 'commands/add_project'
require 'commands/add_metric'
require 'commands/edit_property'
require 'storage/metric_mongo'
require 'storage/project_mongo'
require 'storage/property_value_mongo'

