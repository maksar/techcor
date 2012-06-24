require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.rspec_opts = ' -r simplecov'
end

desc "Creates bunch of test data in database"
task :seed do
  require_relative 'db/seed'
  seed
end

desc "Run Cucumber & RSpec to generate aggregated coverage"
task :default do
  FileUtils.rm_rf('coverage')

  Rake::Task['rspec'].invoke
  Rake::Task["cucumber"].invoke
end

require 'jeweler'
require_relative 'lib/tc/version'
Jeweler::Tasks.new do |gem|
  gem.name = "tc"
  gem.homepage = "http://github.com/maksar/tc"
  gem.license = "MIT"
  gem.summary = %Q{Console tool allowing to perform technical coordination activities}
  gem.description = %Q{This gem provides 'tc' console utility, which allows to collect and manage different metrics on software projects.}
  gem.email = "Maksar.mail@gmail.com"
  gem.authors = ["Alexander Shestakov"]

  gem.executables = %w(tc)
  gem.version = TC::Version::STRING

  gem.files.exclude '.*'
  gem.files.exclude '*.gemspec'

  gem.add_dependency 'mongoid', '~> 3.0.0.rc'
  gem.add_dependency 'bson_ext'
  gem.add_dependency 'hirb'
  gem.add_dependency 'gli', '~> 2.0.0.rc'
end
Jeweler::RubygemsDotOrgTasks.new
