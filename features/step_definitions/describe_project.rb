When /^I'm describing project$/ do
  @console = DescribeProject.new(@project_name, @date_format).call
end