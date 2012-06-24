When /^I execute cli "(.*)"$/ do |command|
  old_stdout = $stdout
  $stdout = Tempfile.new("")

  TechcorCli.exec Shellwords.shellwords command

  $stdout.rewind
  @console = $stdout.readlines.join
  $stdout = old_stdout
end

Then /^the cli output should contain "(.*)"$/ do |text|
  @console.should include text
end

Then /^the cli output should match \/(.*)\/$/ do |text|
  @console.should =~ Regexp.new(text)
end

Then /^the cli output should contain:$/ do |text|
  @console.should include text
end