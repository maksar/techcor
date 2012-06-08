require 'spec_helper'
require 'project_presenter'

describe ProjectPresenter do

  let(:format) {
    {
        "Name" => "name",
        "Length" => "'Length: ' + property('length').value.to_s"
    }
  }

  let(:catalog) {
    ProjectCatalog.new.
        add_project(Project.new(name: 'first').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 2)).
        add_project(Project.new(name: 'second').add_metric(NumberMetric.new(name: 'length')).edit_property('length', 1))
  }

  it 'presents list of projects according to specified format' do
    ProjectPresenter.new(format).present(catalog.projects).should == <<-TXT.chomp
+--------+-------------+
| Name   | Length      |
+--------+-------------+
| first  | Length: 2.0 |
| second | Length: 1.0 |
+--------+-------------+
2 rows in set
TXT
  end
end