$LOAD_PATH.unshift(File.expand_path('../../', File.dirname(__FILE__)))

require 'lib/metric'

describe Metric do
  context 'integer metric' do
    subject { Metric.new('test', Numeric) }
    it 'able to validate property value' do
      subject.validate_value(1).should be_true
      subject.validate_value(1.1).should be_true
      subject.validate_value("1").should be_false
    end
  end
end
