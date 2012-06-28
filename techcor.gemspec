# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "techcor"
  s.version = "0.0.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Shestakov"]
  s.date = "2012-06-28"
  s.description = "This gem provides 'techcor' console utility, which allows to collect and manage different metrics on software projects."
  s.email = "Maksar.mail@gmail.com"
  s.executables = ["techcor"]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "bin/techcor",
    "config/cucumber.yml",
    "config/mongoid.yml",
    "config/mongoid.yml.sample",
    "db/seed.rb",
    "features/add_metric.feature",
    "features/add_project.feature",
    "features/console_interface.feature",
    "features/describe_project.feature",
    "features/edit_property.feature",
    "features/list_projects.feature",
    "features/property_history.feature",
    "features/rake.feature",
    "features/step_definitions/add_project.rb",
    "features/step_definitions/console_interface.rb",
    "features/step_definitions/list_projects.rb",
    "features/step_definitions/property_history.rb",
    "features/step_definitions/rake.rb",
    "features/support/env.rb",
    "lib/commands/add_metric.rb",
    "lib/commands/add_project.rb",
    "lib/commands/describe_project.rb",
    "lib/commands/edit_property.rb",
    "lib/commands/gli/add.rb",
    "lib/commands/gli/add_metric.rb",
    "lib/commands/gli/describe.rb",
    "lib/commands/gli/edit_property.rb",
    "lib/commands/gli/history.rb",
    "lib/commands/gli/hooks.rb",
    "lib/commands/gli/list.rb",
    "lib/commands/gli/program.rb",
    "lib/commands/list_projects.rb",
    "lib/commands/view_history.rb",
    "lib/console_formatter.rb",
    "lib/formatter.rb",
    "lib/gli_interface.rb",
    "lib/metrics/boolean_metric.rb",
    "lib/metrics/metric.rb",
    "lib/metrics/number_metric.rb",
    "lib/metrics/string_metric.rb",
    "lib/project.rb",
    "lib/project_catalog.rb",
    "lib/property_value.rb",
    "lib/storage/metric_mongo.rb",
    "lib/storage/project_mongo.rb",
    "lib/storage/property_value_mongo.rb",
    "lib/techcor.rb",
    "lib/techcor/seed.rb",
    "lib/techcor/version.rb",
    "spec/integration/mongo_spec.rb",
    "spec/lib/commands/add_metric_spec.rb",
    "spec/lib/commands/add_project_spec.rb",
    "spec/lib/commands/describe_project_spec.rb",
    "spec/lib/commands/edit_property_spec.rb",
    "spec/lib/commands/list_projects_spec.rb",
    "spec/lib/commands/view_history_spec.rb",
    "spec/lib/console_formatter_spec.rb",
    "spec/lib/formatter_spec.rb",
    "spec/lib/metrics/boolean_metric_spec.rb",
    "spec/lib/metrics/metric_spec.rb",
    "spec/lib/metrics/number_metric_spec.rb",
    "spec/lib/metrics/string_metric_spec.rb",
    "spec/lib/project_catalog_spec.rb",
    "spec/lib/project_spec.rb",
    "spec/lib/storage/metric_mongo_spec.rb",
    "spec/lib/storage/project_mongo_spec.rb",
    "spec/lib/storage/property_value_mongo_spec.rb",
    "spec/lib/techcor/seed_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/maksar/techcor"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Console tool allowing to perform technical coordination activities"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<mongoid>, [">= 0"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 0"])
      s.add_runtime_dependency(%q<hirb>, [">= 0"])
      s.add_runtime_dependency(%q<gli>, ["~> 2.0.0.rc"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<mongoid>, ["~> 3.0.0.rc"])
      s.add_runtime_dependency(%q<bson_ext>, [">= 0"])
      s.add_runtime_dependency(%q<hirb>, [">= 0"])
      s.add_runtime_dependency(%q<gli>, ["~> 2.0.0.rc"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<mongoid>, [">= 0"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<hirb>, [">= 0"])
      s.add_dependency(%q<gli>, ["~> 2.0.0.rc"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<mongoid>, ["~> 3.0.0.rc"])
      s.add_dependency(%q<bson_ext>, [">= 0"])
      s.add_dependency(%q<hirb>, [">= 0"])
      s.add_dependency(%q<gli>, ["~> 2.0.0.rc"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<mongoid>, [">= 0"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<hirb>, [">= 0"])
    s.add_dependency(%q<gli>, ["~> 2.0.0.rc"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<mongoid>, ["~> 3.0.0.rc"])
    s.add_dependency(%q<bson_ext>, [">= 0"])
    s.add_dependency(%q<hirb>, [">= 0"])
    s.add_dependency(%q<gli>, ["~> 2.0.0.rc"])
  end
end

