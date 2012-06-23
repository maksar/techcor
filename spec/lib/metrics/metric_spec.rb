require 'spec_helper'

describe Metric do
  specify { subject.convert('1').should eq '1' }
  specify { subject.convert('1abc').should eq '1abc' }
  specify { subject.convert(1.2).should eq 1.2 }
  specify { subject.convert({}).should eq({}) }

  it 'returns last value' do
    value = stub(:value)
    subject.stub(:values => [value, value, stub(:last_value, :value => value)])
    subject.value.should == value
  end
end
