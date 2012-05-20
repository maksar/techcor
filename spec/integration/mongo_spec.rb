require 'spec_helper'

require 'lib/project'
require 'lib/metrics/metric'
require 'lib/property_value'
require 'lib/metrics/number_metric'

describe Project do
  it "saves and loads project" do
    project = Project.new.add_metric(NumberMetric.new(name: 'length')).
        edit_property("length", 10).
        edit_property("length", 20)

    project.save

    loaded = Project.where(_id: project.id).last

    loaded.property('length').value.should == 20

    project.delete
  end
end
