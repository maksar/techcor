require 'spec_helper'

describe EditProperty do
  it 'edits property of the project' do
    result = stub(:result)
    metric_name = stub(:metric_name)
    value = stub(:value)
    author = stub(:author)
    project = stub(:project).tap { |p| p.should_receive(:edit_property).with(metric_name, value, author) { result } }
    subject.call(project, metric_name, value, author).should == result
  end

  it 'find project' do
    result = stub(:result)
    project_name = stub(:project_name)
    Project.should_receive(:find_by).with(name: project_name) { result }
    subject.project(project_name).should == result
  end
end