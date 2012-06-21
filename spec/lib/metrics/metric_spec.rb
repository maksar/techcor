require 'spec_helper'

describe Metric do
  specify { subject.convert('1').should eq '1' }
  specify { subject.convert('1abc').should eq '1abc' }
  specify { subject.convert(1.2).should eq 1.2 }
  specify { subject.convert({}).should eq({}) }
end
