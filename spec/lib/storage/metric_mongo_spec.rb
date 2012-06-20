require 'spec_helper'

describe Metric do
  it { should be_mongoid_document }
  it { should be_timestamped_document }

  it { should have_field(:name) }
  it { should be_embedded_in(:project) }
  it { should embed_many(:values).of_type(PropertyValue) }

  it { should validate_uniqueness_of(:name) }
end