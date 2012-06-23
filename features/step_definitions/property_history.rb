Given /^catalog filled by seeds script$/ do
  require_relative '../../db/seed'
  seed
end

When /^date format "(.*)"$/ do |date_format|
  @date_format = date_format
end

Given /^property "(.*)"$/ do |property|
  @properties ||= []
  @properties << property
end

Given /^property not set$/ do
  @properties = nil
end

When /^I'm viewing property history$/ do
  @console = ViewHistory.new(@project_name, @date_format, @properties).call
end

When /^project "(.*)"$/ do |project_name|
  @project_name = project_name
end
