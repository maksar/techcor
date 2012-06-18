require 'simplecov'

require 'hirb'
require 'mongoid'

ENV['RACK_ENV'] = 'test'
Mongoid.load!("config/mongoid.yml")

$: << File.expand_path(File.dirname(File.realpath(__FILE__)) + '/../../lib')

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
