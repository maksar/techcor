require 'spec_helper'

describe AddProject do
  it 'adds new project to the database' do
    name = stub(:name)
    project = stub(:project)
    Project.should_receive(:create).with(name: name) { project }
    subject.call(name).should == project
  end
end