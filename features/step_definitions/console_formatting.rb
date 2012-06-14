require 'lib/project_catalog'
require 'lib/project'
require 'lib/console_formatter'
require 'lib/property_value'
require 'lib/metrics/metric'
require 'lib/metrics/number_metric'

Given /^two projects in catalog$/ do |table|
  @catalog = ProjectCatalog.new
  table.hashes.each do |hash|
    @catalog.add_project(Project.new(name: hash[:name]).add_metric(NumberMetric.new(name: hash[:property])).edit_property(hash[:property], hash[:value]))
  end
end

Given /^no projects in catalog$/ do
  @catalog = ProjectCatalog.new
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
  end
end

When /^I'm listing all projects in console$/ do
  @console = ConsoleFormatter.new(@format).present(@catalog.projects @criteria)
end

Then /^console output should look like:$/ do |text|
  @console.should == text
end

