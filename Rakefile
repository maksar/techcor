require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.rspec_opts = ' -r simplecov'
end

desc "Run cucumber & rspec to generate aggregated coverage"
task :default do
  FileUtils.rm_rf('coverage')

  Rake::Task['rspec'].invoke
  Rake::Task["cucumber"].invoke
end
