Feature: Describing project
  In order to view project metrics
  As a console user
  I want to see state of all current project metrics

  Scenario: describing project
    Given catalog filled by seeds script
    When I execute cli "describe --df ---- TC"
    Then the cli output should contain:
    """
    +-------------------------+----------------------------------------+------------+-------------+
    | Metric                  | Value                                  | Changed at | Changed by  |
    +-------------------------+----------------------------------------+------------+-------------+
    | Technology              | Ruby                                   | ----       | a.shestakov |
    | Active                  | true                                   | ----       | a.shestakov |
    | SCM                     | http://github.com/maksar/techcor       | ----       | a.shestakov |
    | CI                      | http://travis-ci.org/#!/maksar/techcor | ----       | a.shestakov |
    | Unit Tests Coverage     | 100.0                                  | ----       | a.shestakov |
    | Unit Tests Count        | 100.0                                  | ----       | a.shestakov |
    | Cucumber Tests Coverage | 92.68                                  | ----       | a.shestakov |
    | Cucumber Tests Count    | 10.0                                   | ----       | a.shestakov |
    | Tests Coverage          | 100.0                                  | ----       | a.shestakov |
    +-------------------------+----------------------------------------+------------+-------------+
    9 rows in set
    """