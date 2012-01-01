$LOAD_PATH.unshift(File.expand_path('../../', File.dirname(__FILE__)))

require 'lib/project'

describe Project do

  it 'returns list of metrics' do
    2.times { subject.add_metric(stub, stub) }
    subject.describe.should have(2).items
  end

  it 'allows to modify existing property' do
    name, type = stub, stub
    subject.add_metric(name, type)
    value = stub
    subject.edit_property(name, value).should be value
  end

  it 'disallows to modify unknown property' do
    name, value = stub, stub
    expect { subject.edit_property(name, value) }.to raise_error
  end

  it 'returns property history' do
    name, type = stub, stub
    subject.add_metric(name, type)

    subject.edit_property(name, value1 = stub)
    subject.edit_property(name, value2 = stub)

    subject.property_history(name).should include value1
    subject.property_history(name).should include value2
  end

  it 'not returns history for non-existing property' do
    expect { subject.property_history(stub) }.to raise_error
  end
end
