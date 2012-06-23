require 'spec_helper'

describe ViewHistory do
  it 'presents properties to table view' do
    result = stub(:result)

    records = stub(:records)
    formatter = stub(:formatter).tap { |f| f.should_receive(:present).with(records) { result } }

    subject.call(formatter, records).should == result
  end

  it 'does not present unknown properties' do
    formatter = stub(:formatter).tap { |f| f.should_receive(:present).with([]) }
    project = stub(:project).tap { |p| p.should_receive(:property) { nil } }
    subject.stub(:project => project)
    subject.stub(:properties => ['UnkwownProperty'])

    subject.call(formatter)
  end

  it 'passes format to console formatter' do
    format = stub(:format)
    ConsoleFormatter.should_receive(:new).with(format)

    subject.formatter(format)
  end

  it 'collects values from metrics' do
    metrics = [stub(:metric, :values => [1, 2]), stub(:metric, :values => [3])]

    subject.records(metrics).should == [1, 2, 3]
  end

  it 'collects metrics from project' do
    project = stub(:project)
    metric1, metric2 = stub(:metric), stub(:metric)
    project.should_receive(:property).with('metric1') { metric1 }
    project.should_receive(:property).with('metric2') { metric2 }
    subject.metrics(project, %w(metric1 metric2)).should == [metric1, metric2]
  end

  it 'constructs format for console formatter' do
    metrics = [stub(:name => "name1"), stub(:name => "name2")]
    subject.format("DATE_FORMAT", metrics).should == {
        'Date' => "created_at.strftime('DATE_FORMAT')",
        'name1' => "metric.name == 'name1' ? value : ''",
        'name2' => "metric.name == 'name2' ? value : ''"
    }
  end

  it 'finds project by its name' do
    name, result = stub(:name), stub(:result)
    Project.should_receive(:find_by).with(name: name) { result }

    subject.project(name).should == result
  end

  it 'lists all properties is none was specified directly' do
    project = stub(:project, :metrics => [stub(:metric, :name => 'name1'), stub(:metric, :name => 'name2')])
    subject.properties(project).should == %w(name1 name2)
  end

end