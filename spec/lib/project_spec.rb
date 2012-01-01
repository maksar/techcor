$LOAD_PATH.unshift(File.expand_path('../../', File.dirname(__FILE__)))

require 'lib/project'

describe Project do

  it 'returns list of metrics' do
    2.times { subject.add_metric(stub, stub) }
    subject.describe.should have(2).items
  end

  it 'returns metric by name' do
    name, value = stub, stub
    subject.add_metric(name, value)
    subject.metric(name).should be value
  end

end
