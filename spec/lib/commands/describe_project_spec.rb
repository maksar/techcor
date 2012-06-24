require 'spec_helper'

describe DescribeProject do
  it 'presents properties to table view' do
    result = stub(:result)

    records = stub(:records)
    formatter = stub(:formatter).tap { |f| f.should_receive(:present).with(records) { result } }

    subject.call(formatter, records).should == result
  end

  it 'passes format to console formatter' do
    format = stub(:format)
    ConsoleFormatter.should_receive(:new).with(format)

    subject.formatter(format)
  end

  it 'collects metrics from project' do
    metrics = stub(:metrics)
    project = stub(:project, :metrics => metrics)
    subject.records(project).should == metrics
  end

  it 'constructs format for console formatter' do
    subject.format("DATE_FORMAT").should == {
        'Metric' => 'name',
        'Value' => 'last_value',
        'Changed at' => "last_updated_at.try :strftime, 'DATE_FORMAT'",
        'Changed by' => "last_updated_by"
    }
  end

  it 'finds project by its name' do
    name, result = stub(:name), stub(:result)
    Project.should_receive(:find_by).with(name: name) { result }

    subject.project(name).should == result
  end

end