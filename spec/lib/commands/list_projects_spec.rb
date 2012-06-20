require 'spec_helper'

describe ListProjects do
  it 'passes format to console formatter' do
    result = stub(:result)

    format = '42'
    formatter = stub(:formatter).tap { |c| c.should_receive(:new).with(eval(format)) { result } }

    ListProjects.new(format).formatter(formatter).should == result
  end

  it 'gets list of projects from catalog according to criteria' do
    result = stub(:result)

    criteria = stub(:criteria)
    catalog = stub(:catalog).tap { |c| c.should_receive(:projects).with(criteria) { result } }

    subject.projects(catalog, criteria).should == result
  end

  it 'presents projects to console' do
    result = stub(:result)

    projects = stub(:projects)
    formatter = stub(:formatter).tap { |f| f.should_receive(:present).with(projects) { result } }

    subject.call(formatter, projects).should == result
  end

  it 'uses default format if no format string was specified' do
    result = stub(:result)

    command = ListProjects.new(nil)
    command.should_receive(:default_format) { result }

    command.formatter(stub.as_null_object)
  end

  it 'builds default format as list of all metrics for all projects' do
    subject.stub(:projects => [
        stub(:metrics => [stub(:name => 'metric1'), stub(:name => 'metric2')]),
        stub(:metrics => [stub(:name => 'metric3')])])
    subject.default_format.should == {'name' => 'name',
                                      'metric1' => "property('metric1').try(:value)",
                                      'metric2' => "property('metric2').try(:value)",
                                      'metric3' => "property('metric3').try(:value)"}
  end
end