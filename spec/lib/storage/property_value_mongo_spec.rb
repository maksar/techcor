require 'spec_helper'

describe PropertyValue do
  it { should be_mongoid_document }
  it { should be_timestamped_document }

  it { should have_field(:value) }
  it { should be_embedded_in(:metric) }
end