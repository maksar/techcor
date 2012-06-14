require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)
RSpec::Core::RakeTask.new(:rspec)


desc "Run cucumber & rspec to generate aggregated coverage"
task :default do
  FileUtils.rm_rf('coverage')
  Rake::Task["cucumber"].invoke
  Rake::Task['rspec'].invoke
end
