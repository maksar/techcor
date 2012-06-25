module Techcor
  class Seed
    def self.seed
      Project.delete_all

      user = 'a.shestakov'

      ProjectCatalog.new.
          add_project(
          Project.new(name: 'TC').
              add_metric(StringMetric.new(name: 'Technology').edit('Ruby', user)).
              add_metric(BooleanMetric.new(name: 'Active').edit(true, user)).
              add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/techcor', user)).
              add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/techcor', user)).
              add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(98.55, user)).
              add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(40, user)).
              add_metric(NumberMetric.new(name: 'Cucumber Tests Coverage').edit(92.68, user)).
              add_metric(NumberMetric.new(name: 'Cucumber Tests Count').edit(10, user)).
              add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100, user)).
              edit_property('Unit Tests Count', 45, user).
              edit_property('Unit Tests Count', 60, user).
              edit_property('Unit Tests Count', 100, user).
              edit_property('Unit Tests Coverage', 99, user).
              edit_property('Unit Tests Coverage', 100, user)
      ).
          add_project(Project.new(name: 'Anagrams').
                          add_metric(StringMetric.new(name: 'Technology').edit('Ruby', user)).
                          add_metric(BooleanMetric.new(name: 'Active').edit(false, user)).
                          add_metric(StringMetric.new(name: 'SCM').edit('http://github.com/maksar/anagrams', user)).
                          add_metric(StringMetric.new(name: 'CI').edit('http://travis-ci.org/#!/maksar/anagrams', user)).
                          add_metric(NumberMetric.new(name: 'Unit Tests Coverage').edit(100, user)).
                          add_metric(NumberMetric.new(name: 'Unit Tests Count').edit(6, user)).
                          add_metric(NumberMetric.new(name: 'Tests Coverage').edit(100, 'john.dow'))).
          save
    end
  end
end
