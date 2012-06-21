require 'spec_helper'

describe StringMetric do
  specify { subject.convert(1).should == '1' }
  specify { subject.convert('1abc').should == '1abc' }
  specify { subject.convert(1.2).should == '1.2' }
end