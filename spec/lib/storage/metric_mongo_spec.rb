require 'spec_helper'
require 'lib/metrics/metric'

describe Metric do
  it { should have_field(:name).of_type(String) }
  it { should be_embedded_in(:project) }
end