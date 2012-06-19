Feature: console command
  In order to do technical coordination
  As a console user
  I want use cli (command line interface)

  Background:
    When I have wide terminal

  Scenario: View general help in cli
    When I run `tc`
    Then the output should contain "Command Line Interface for Technical Coordination"
    And the output should contain "usage: tc [global options] command [command options]"
    And the output have option "add" with description "Adds new project"
    And the output have option "add_metric" with description "Adds new metric to the project"
    And the output have option "edit_property" with description "Edits one metric of the project"
    And the output have option "list" with description "List projects from catalog"
    And the output have option "help" with description "Shows list of commands or help for one command"

  Scenario: View help of add command
    When I run `tc help add`
    Then the output should contain "add {project_name}"
    And the output should contain "Adds new project"
    And the output should contain "Allows to create new project"

  Scenario: View help of add_metric command
    When I run `tc help add_metric`
    Then the output should contain "add_metric [command options] {metric_name}"
    And the output should contain "Adds new metric to the project"
    And the output should contain "Allows to add new metric to the project"
    And the output should have flag "mt/metric_type" with name "metric type" and description "type of the metric you want to add (string, number) (default: string)"
    And the output should have flag "pn/project_name" with name "project name" and description "name of the project, to which you want to add metric"

  Scenario: View help of edit_property command
    When I run `tc help edit_property`
    Then the output should contain "edit_property [command options] {value}"
    And the output should contain "Edits one metric of the project"
    And the output should contain "Allows to edit one of the project's metrics"
    And the output should have flag "mn/metric_name" with name "metric name" and description "name of the metric, which you want to edit"
    And the output should have flag "pn/project_name" with name "project name" and description "name of the project, property of which you want to edit"

  Scenario: View help of list command
    When I run `tc help list`
    Then the output should contain "list [command options] {criteria}"
    And the output should contain "List projects from catalog"
    And the output should contain "Lists projects from catalog matching specified criteria"
    And the output should have flag "fm/format" with name "table format" and description "ruby code for table format (default: {'Name' => 'name'})"
