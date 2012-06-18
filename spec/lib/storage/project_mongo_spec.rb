require 'spec_helper'

describe Project do
  it { should have_field(:name) }
  it { should embed_many(:metrics) }

  it { should have_field(:created_at) }
  it { should have_field(:updated_at) }

end