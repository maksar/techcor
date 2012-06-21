Then /^the output have option "(\w+)" with description "(.*)"$/ do |option, description|
  step "the output should match /#{option}\\s+- #{Regexp.quote description}/"
end

When /^the output should have flag "(\w+)\/(\w+)" with name "(.*)" and description "(.*)"$/ do |short_flag, long_flag, name, description|
  step "the output should match /--#{Regexp.quote short_flag}, --#{Regexp.quote long_flag}=#{Regexp.quote name}[\\s]+- #{Regexp.quote description}/"
end

When /^I have "(\w+)" environment variable set to "(.*)"$/ do |variable, value|
  set_env variable, value
end

When /^I have wide terminal$/ do
  step "I have \"COLUMNS\" environment variable set to \"1000\""
end
