Feature: Adding metric
  In order to add new metric to the project
  As a console user
  I want to be able to do that

  Scenario: adding metric
    Given catalog filled by seeds script
    When I execute cli "add_metric --pn TC --mt number new_metric"
    Then the cli output should contain "Metric new_metric with type number was successfully added to project TC."
