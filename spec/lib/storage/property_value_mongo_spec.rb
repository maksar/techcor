require 'spec_helper'

describe PropertyValue do
  it { should have_field(:value) }
  it { should be_embedded_in(:metric) }

  it { should have_field(:created_at) }
  it { should have_field(:updated_at) }
end