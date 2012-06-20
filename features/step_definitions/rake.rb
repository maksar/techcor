When /^the output should contain rake command "(\w+)" with description "(.*)"$/ do |name, description|
  step "the output should match /rake #{Regexp.quote name}[\\s]+\\# #{Regexp.quote description}/"
end