Given /^catalog filled by seeds script$/ do
  require_relative '../../db/seed'
  Techcor::Seed.seed
end
