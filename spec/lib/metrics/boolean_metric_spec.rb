require 'spec_helper'

describe BooleanMetric do
  specify { subject.convert(1).should == true }
  specify { subject.convert('abc').should == true }
  specify { subject.convert({}).should == true }
  specify { subject.convert(false).should == false }
  specify { subject.convert(nil).should == false }
end