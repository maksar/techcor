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
end