require 'spec_helper'

describe ListProjects do

  class DummyListFormatter < Struct.new :format
    def present records
      records
    end
  end

  it 'passes format to formatter class' do
    format = '42'

    ListProjects.new(format).formatter(DummyListFormatter).format.should == 42
  end

  it 'gets list of projects from catalog according to criteria' do
    result = stub(:result)

    criteria = stub(:criteria)
    catalog = stub(:catalog).tap { |c| c.should_receive(:projects).with(criteria) { result } }

    subject.projects(catalog, criteria).should == result
  end

  it 'presents projects to table view' do
    projects = stub(:projects)

    ListProjects.new('42').call(DummyListFormatter, projects).should == projects
  end

  it 'uses default format if no format string was specified' do
    result = stub(:result)

    command = ListProjects.new(nil)
    command.should_receive(:default_format) { result }

    command.formatter(DummyListFormatter)
  end

  it 'builds default format as list of all metrics for all projects' do
    subject.stub(:projects => [
        stub(:metrics => [stub(:name => 'metric1'), stub(:name => 'metric2')]),
        stub(:metrics => [stub(:name => 'metric3')])])
    subject.default_format.should == {'Name' => 'name',
                                      'metric1' => "property('metric1').try :last_value",
                                      'metric2' => "property('metric2').try :last_value",
                                      'metric3' => "property('metric3').try :last_value"}
  end
end