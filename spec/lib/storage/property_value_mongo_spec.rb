require 'spec_helper'

describe PropertyValue do
  it { should be_mongoid_document }
  it { should be_timestamped_document }

  it { should have_field(:value) }
  it { should have_field(:created_by) }
  it { should validate_presence_of(:created_by) }
  it { should be_embedded_in(:metric) }
end