require 'spec_helper'

describe Metric do
  specify { subject.convert('1').should eq '1' }
  specify { subject.convert('1abc').should eq '1abc' }
  specify { subject.convert(1.2).should eq 1.2 }
  specify { subject.convert({}).should eq({}) }

  it 'returns last value' do
    value = stub(:value)
    subject.stub(:values => [stub, stub, stub(:last_value, :value => value)])
    subject.last_value.should == value
  end

  it 'returns last updater' do
    user = stub(:user)
    subject.stub(:values => [stub, stub, stub(:last_value, :created_by => user)])
    subject.last_updated_by.should == user
  end

  it 'returns last update date' do
    date = stub(:date)
    subject.stub(:values => [stub, stub, stub(:last_value, :created_at => date)])
    subject.last_updated_at.should == date
  end
end
