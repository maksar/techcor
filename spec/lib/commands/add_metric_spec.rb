require 'spec_helper'

describe AddMetric do
  it 'adds metric to the project' do
    result = stub(:result)
    metric = stub(:metric)
    project = stub(:project).tap { |p| p.should_receive(:add_metric).with(metric) { result } }
    subject.call(project, metric)
  end

  it 'find project' do
    result = stub(:result)
    project_name = stub(:project_name)
    Project.should_receive(:find_by).with(name: project_name) { result }
    subject.project(project_name).should == result
  end

  it 'creates appropriate metric class' do
    subject.metric_class(:string).should == StringMetric
    subject.metric_class(:number).should == NumberMetric
    subject.metric_class(nil).should == Metric
  end

  it 'creates metric' do
    result = stub(:result)
    name = stub(:name)
    metric_class = stub(:metric_class).tap { |mc| mc.should_receive(:new).with(name: name) { result } }

    subject.metric(metric_class, name).should == result
  end
end