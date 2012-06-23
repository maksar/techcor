Feature: Describing project
  In order to view project metrics
  As a console user
  I want to see state of all current project metrics

  Background:
    Given catalog filled by seeds script
    And date format "----"

  Scenario: describing project
    Given project "TC"
    When I'm describing project
    Then console output should look like
    """
    +-------------------------+-----------------------------------+------------+------------+
    | Metric                  | Value                             | Changed at | Changed by |
    +-------------------------+-----------------------------------+------------+------------+
    | Technology              | Ruby                              | ----       | TODO       |
    | Active                  | true                              | ----       | TODO       |
    | SCM                     | http://github.com/maksar/tc       | ----       | TODO       |
    | CI                      | http://travis-ci.org/#!/maksar/tc | ----       | TODO       |
    | Unit Tests Coverage     | 100.0                             | ----       | TODO       |
    | Unit Tests Count        | 100.0                             | ----       | TODO       |
    | Cucumber Tests Coverage | 92.68                             | ----       | TODO       |
    | Cucumber Tests Count    | 10.0                              | ----       | TODO       |
    | Tests Coverage          | 100.0                             | ----       | TODO       |
    +-------------------------+-----------------------------------+------------+------------+
    9 rows in set
    """