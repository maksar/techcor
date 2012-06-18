require 'spec_helper'

describe AddProject do
  it 'adds new project to the database' do
    name = stub(:name)
    project = stub(:project).tap { |p| p.should_receive(:save) }
    Project.should_receive(:new).with(name: name) { project }
    AddProject.new(name).call
  end
end