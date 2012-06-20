ENV['RACK_ENV'] ||= 'development'

require 'mongoid'
config_folder = File.expand_path(File.dirname(File.realpath(__FILE__)) + '/../config')
`cp #{config_folder}/mongoid.yml.sample #{config_folder}/mongoid.yml` unless File.exists? "#{config_folder}/mongoid.yml"
Mongoid.load!("config/mongoid.yml")

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

Project.delete_all

ProjectCatalog.new.
    add_project(Project.new(name: 'TC').
                    add_metric(StringMetric.new(name: 'Technology').edit('Ruby')).
                    add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/tc')).
                    add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/tc')).
                    add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(98.55)).
                    add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(40)).
                    add_metric(NumberMetric.new(name: 'Cucumber Tests Coverage').edit(92.68)).
                    add_metric(NumberMetric.new(name: 'Cucumber Tests Count').edit(10)).
                    add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100))).
    add_project(Project.new(name: 'Anagrams').
                    add_metric(StringMetric.new(name: 'Technology').edit('Ruby')).
                    add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/anagrams')).
                    add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/anagrams')).
                    add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(100)).
                    add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(6)).
                    add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100))).
    save