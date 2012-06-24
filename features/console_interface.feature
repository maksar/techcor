Feature: console command
  In order to do technical coordination
  As a console user
  I want use cli (command line interface)

  Scenario: View general help in cli
    When I execute cli "help"
    Then the cli output should contain "Command Line Interface for Technical Coordination"
    And the cli output should contain "[global options] command [command options] [arguments...]"
    And the output have option "add" with description "Adds new project"
    And the output have option "add_metric" with description "Adds new metric to the project"
    And the output have option "edit_property" with description "Edits one metric of the project"
    And the output have option "list" with description "List projects from catalog"

  Scenario: View help of add command
    When I execute cli "help add"
    Then the cli output should contain "Adds new project"
    And the cli output should contain "add [command options] {project_name}"
    And the cli output should contain "Adds new project"
    And the cli output should contain "Allows to create new project"

  Scenario: View help of add_metric command
    When I execute cli "help add_metric"
    Then the cli output should contain "add_metric [command options] {metric_name}"
    And the cli output should contain "Adds new metric to the project"
    And the cli output should contain "Allows to add new metric to the project"
    And the output should have flag "mt/metric_type" with name "metric type" and description "type of the metric you want to add (string, number, boolean) (default: string)"
    And the output should have flag "pn/project_name" with name "project name" and description "name of the project, to which you want to add metric"

  Scenario: View help of edit_property command
    When I execute cli "help edit_property"
    Then the cli output should contain "edit_property [command options] {value}"
    And the cli output should contain "Edits one metric of the project"
    And the cli output should contain "Allows to edit one of the project's metrics"
    And the output should have flag "mn/metric_name" with name "metric name" and description "name of the metric, which you want to edit"
    And the output should have flag "pn/project_name" with name "project name" and description "name of the project, property of which you want to edit"

  Scenario: View help of list command
    When I execute cli "help list"
    Then the cli output should contain "list [command options] {criteria}"
    And the cli output should contain "List projects from catalog"
    And the cli output should contain "Lists projects from catalog matching specified criteria"
    And the output should have flag "fm/format" with name "table format" and description "ruby code for table format"

  Scenario: View help of history command
    When I execute cli "help history"
    Then the cli output should contain "history [command options] [{property}],[{another_property}],[...]"
    And the cli output should contain "Displays property history"
    And the cli output should contain "Displays one or more properties history (list of values over time)"
    And the output should have flag "pn/project_name" with name "project name" and description "name of the project, property of which you want to edit"
    And the output should have flag "df/date_format" with name "date format" and description "ruby date format to display time of change (default: %d-%m-%Y)"

  Scenario: View help of describe command
    When I execute cli "help describe"
    Then the cli output should contain "describe [command options] {project_name}"
    And the cli output should contain "Describes current state of the project"
    And the cli output should contain "Displays current metrics of the project, date and author of last modification"
    And the output should have flag "df/date_format" with name "date format" and description "ruby date format to display time of change (default: %d-%m-%Y)"
