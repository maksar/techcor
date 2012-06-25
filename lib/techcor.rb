require 'hirb'
require 'mongoid'

config_folder = File.expand_path(File.dirname(File.realpath(__FILE__)) + '/../config')
`cp #{config_folder}/mongoid.yml.sample #{config_folder}/mongoid.yml` unless File.exists? "#{config_folder}/mongoid.yml"

Mongoid.load!("#{config_folder}/mongoid.yml")

$: << File.expand_path(File.dirname(File.realpath(__FILE__)) + '/../lib')

require 'project'
require 'property_value'
require 'project_catalog'
require 'console_formatter'
require 'metrics/metric'
require 'metrics/number_metric'
require 'metrics/string_metric'
require 'metrics/boolean_metric'
require 'commands/list_projects'
require 'commands/add_project'
require 'commands/add_metric'
require 'commands/edit_property'
require 'commands/view_history'
require 'commands/describe_project'
require 'storage/metric_mongo'
require 'storage/project_mongo'
require 'storage/property_value_mongo'
require 'techcor/seed'