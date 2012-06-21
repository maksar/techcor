require 'spec_helper'

describe NumberMetric do
  specify { subject.convert('1').should == 1 }
  specify { subject.convert('1abc').should == 1 }
  specify { subject.convert(1.2).should == 1.2 }
  specify { subject.convert('abc').should == 0 }
end