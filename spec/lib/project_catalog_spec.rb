require 'spec_helper'
require 'lib/project_catalog'
require 'lib/project'
require 'lib/metrics/metric'
require 'lib/metrics/number_metric'

describe ProjectCatalog do

  it 'adds project to catalog' do
    project = stub
    subject.add_project(project)
    subject.projects.should include project
  end

  context 'having list of different projects' do
    subject {
      ProjectCatalog.new.
          add_project(Project.new.add_metric(NumberMetric.new('length')).edit_property('length', 3)).
          add_project(Project.new.add_metric(NumberMetric.new('length')).edit_property('length', 2)).
          add_project(Project.new.add_metric(NumberMetric.new('length')).edit_property('length', 1))
    }

    it 'searches projects by simple criteria' do
      subject.projects('property("length") >= 2').should have_exactly(2).items
    end

    it 'searches projects by complex criteria' do
      subject.projects('property("length") == 2 || property("length") == 3').should have_exactly(2).items
    end
  end
end
