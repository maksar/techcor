$LOAD_PATH.unshift(File.expand_path('../../', File.dirname(__FILE__)))

require 'lib/project_catalog'

describe ProjectCatalog do

  it 'adds project to catalog' do
    project = stub
    subject.add_project(project)
    subject.projects.should include project
  end
end
