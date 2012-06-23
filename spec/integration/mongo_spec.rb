require 'spec_helper'

describe ProjectCatalog do

  before { Project.delete_all }

  subject {
    ProjectCatalog.new.
        add_project(Project.new(name: '1').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 3, 'user')).
        add_project(Project.new(name: '2').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 2, 'user')).
        add_project(Project.new(name: '3').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 1, 'user'))
  }

  it 'loads list of saved projects' do
    subject.save

    ProjectCatalog.load.projects.should have_exactly(3).items
  end
end
