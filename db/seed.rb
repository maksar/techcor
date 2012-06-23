ENV['RACK_ENV'] ||= 'development'

require_relative '../lib/tc'

def seed
  Project.delete_all

  ProjectCatalog.new.
      add_project(
      Project.new(name: 'TC').
          add_metric(StringMetric.new(name: 'Technology').edit('Ruby')).
          add_metric(BooleanMetric.new(name: 'Active').edit(true)).
          add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/tc')).
          add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/tc')).
          add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(98.55)).
          add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(40)).
          add_metric(NumberMetric.new(name: 'Cucumber Tests Coverage').edit(92.68)).
          add_metric(NumberMetric.new(name: 'Cucumber Tests Count').edit(10)).
          add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100)).
          edit_property('Unit Tests Count', 45).
          edit_property('Unit Tests Count', 60).
          edit_property('Unit Tests Count', 100).
          edit_property('Unit Tests Coverage', 99).
          edit_property('Unit Tests Coverage', 100)
  ).
      add_project(Project.new(name: 'Anagrams').
                      add_metric(StringMetric.new(name: 'Technology').edit('Ruby')).
                      add_metric(BooleanMetric.new(name: 'Active').edit(false)).
                      add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/anagrams')).
                      add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/anagrams')).
                      add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(100)).
                      add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(6)).
                      add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100))).
      save
end

seed