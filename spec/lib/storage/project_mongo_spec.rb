require 'spec_helper'

describe Project do
  it { should be_mongoid_document }
  it { should be_timestamped_document }

  it { should have_field(:name) }
  it { should embed_many(:metrics) }

  it { should validate_uniqueness_of(:name) }
end