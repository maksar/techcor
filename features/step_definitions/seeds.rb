When /^I work in "(\w+)" environment$/ do |environment|
  step "I have \"RACK_ENV\" environment variable set to \"#{environment}\""
end

When /^I have "(\w+)" environment variable set to "(.*)"$/ do |variable, value|
  set_env variable, value
end
