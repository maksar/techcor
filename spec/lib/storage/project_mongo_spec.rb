require 'spec_helper'
require 'lib/project'

describe Project do
  it { should embed_many(:metrics) }
end