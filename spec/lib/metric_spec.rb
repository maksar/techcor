require 'spec_helper'
require 'lib/metrics/metric'
require 'lib/metrics/number_metric'
require 'lib/metrics/string_metric'

describe Metric do
  context 'simple metric' do
    subject { Metric.new(stub) }
    it 'not converts value at all' do
      subject.convert('1').should eq '1'
      subject.convert('1abc').should eq '1abc'
      subject.convert(1.2).should eq 1.2
      subject.convert({}).should eq({})
    end
  end

  context 'number metric' do
    subject { NumberMetric.new(stub) }
    it 'converts value to number' do
      subject.convert('1').should eq 1
      subject.convert('1abc').should eq 1
      subject.convert('1.2abc').should eq 1.2
      subject.convert('abc').should eq 0
    end
  end

  context 'string metric' do
    subject { StringMetric.new(stub) }
    it 'converts value to string' do
      subject.convert(1).should eq '1'
      subject.convert('1abc').should eq '1abc'
      subject.convert(1.2).should eq '1.2'
    end
  end

end
