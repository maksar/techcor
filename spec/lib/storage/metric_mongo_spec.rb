require 'spec_helper'
require 'lib/metrics/metric'

describe Metric do
  it { should have_field(:name) }
  it { should be_embedded_in(:project) }
  it { should embed_many(:values).of_type(PropertyValue) }
end