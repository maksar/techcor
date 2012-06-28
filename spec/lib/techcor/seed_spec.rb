require 'spec_helper'

describe Techcor::Seed do
  it 'fills database with data' do
    Project.delete_all
    Techcor::Seed.seed
    ProjectCatalog.load.projects.count.should == 2
  end
end
