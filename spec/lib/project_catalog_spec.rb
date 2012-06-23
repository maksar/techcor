require 'spec_helper'

describe ProjectCatalog do

  subject {
    ProjectCatalog.new.
        add_project(Project.new(name: '1').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 3, stub)).
        add_project(Project.new(name: '3').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 2, stub)).
        add_project(Project.new(name: '2').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 1, stub))
  }

  it 'searches projects by simple criteria' do
    subject.projects('property("length").value >= 2').should have_exactly(2).items
  end

  it 'searches projects by complex criteria' do
    subject.projects('property("length").value == 2 || property("length").value == 3').should have_exactly(2).items
  end

  it 'orders projects by name' do
    subject.projects.collect(&:name).should == %w(1 2 3)
  end
end
