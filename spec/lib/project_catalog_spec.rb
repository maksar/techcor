require 'spec_helper'
require 'lib/project_catalog'
require 'lib/project'
require 'lib/metrics/metric'
require 'lib/metrics/number_metric'

describe ProjectCatalog do

  before { Project.delete_all }

  subject {
    ProjectCatalog.new.
        add_project(Project.new.add_metric(NumberMetric.new(name: 'length')).edit_property('length', 3)).
        add_project(Project.new.add_metric(NumberMetric.new(name: 'length')).edit_property('length', 2)).
        add_project(Project.new.add_metric(NumberMetric.new(name: 'length')).edit_property('length', 1))
  }

  it 'loads list of saved projects' do
    subject.save

    subject.load.should have_exactly(3).items
  end

  it 'searches projects by simple criteria' do
    subject.projects('property("length").value >= 2').should have_exactly(2).items
  end

  it 'searches projects by complex criteria' do
    subject.projects('property("length").value == 2 || property("length").value == 3').should have_exactly(2).items
  end
end
