require 'spec_helper'

describe DescribeProject do

  class DummyDescribeFormatter < Struct.new :format
    def present records
      records
    end
  end


  it 'presents properties to table view' do
    records = stub(:records)

    subject.call(DummyDescribeFormatter, records).should == records
  end

  it 'passes format to formatter class' do
    format = stub(:format)
    formatter = stub.tap { |f| f.should_receive(:new).with(format) }

    subject.formatter(formatter, format)
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