Given /^no projects in catalog$/ do
  Project.delete_all
end

Given /^criteria (.*)$/ do |criteria|
  @criteria = criteria
end

Given /^empty criteria$/ do
  @criteria = ""
end

When /^output format$/ do |table|
  @format = table.hashes.inject({}) do |result, hash|
    result.merge hash[:column] => hash[:expression]
  end.inspect
end

When /^empty format$/ do
  @format = nil
end

When /^I'm listing all projects in console$/ do
  @console = ListProjects.new(@format, @criteria).call
end

Then /^console output should look like$/ do |text|
  @console.should == text
end
