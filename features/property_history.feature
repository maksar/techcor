Feature: Property history
  In order to view property history
  As a console user
  I want to specify property(ies) and see its history

  Background:
    Given catalog filled by seeds script
    And date format "%Y"

  Scenario: trying to list non-existing property
    Given property "non existing property"
    And project "TC"
    When I'm viewing property history
    Then console output should look like
    """
    0 rows in set
    """

  Scenario: listing property history
    Given property "Unit Tests Count"
    And project "TC"
    When I'm viewing property history
    Then console output should look like
    """
    +------+------------------+
    | Date | Unit Tests Count |
    +------+------------------+
    | 2012 | 40.0             |
    | 2012 | 45.0             |
    | 2012 | 60.0             |
    | 2012 | 100.0            |
    +------+------------------+
    4 rows in set
    """

  Scenario: listing all properties history
    Given property not set
    And project "TC"
    When I'm viewing property history
    Then console output should look like
    """
    +------+------------+--------+-----------------------------+-----------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    | Date | Technology | Active | SCM                         | CI                                | Unit Tests Coverage | Unit Tests Count | Cucumber Tests Coverage | Cucumber Tests Count | Tests Coverage |
    +------+------------+--------+-----------------------------+-----------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    | 2012 | Ruby       |        |                             |                                   |                     |                  |                         |                      |                |
    | 2012 |            | true   |                             |                                   |                     |                  |                         |                      |                |
    | 2012 |            |        | http://github.com/maksar/tc |                                   |                     |                  |                         |                      |                |
    | 2012 |            |        |                             | http://travis-ci.org/#!/maksar/tc |                     |                  |                         |                      |                |
    | 2012 |            |        |                             |                                   | 98.55               |                  |                         |                      |                |
    | 2012 |            |        |                             |                                   | 99.0                |                  |                         |                      |                |
    | 2012 |            |        |                             |                                   | 100.0               |                  |                         |                      |                |
    | 2012 |            |        |                             |                                   |                     | 40.0             |                         |                      |                |
    | 2012 |            |        |                             |                                   |                     | 45.0             |                         |                      |                |
    | 2012 |            |        |                             |                                   |                     | 60.0             |                         |                      |                |
    | 2012 |            |        |                             |                                   |                     | 100.0            |                         |                      |                |
    | 2012 |            |        |                             |                                   |                     |                  | 92.68                   |                      |                |
    | 2012 |            |        |                             |                                   |                     |                  |                         | 10.0                 |                |
    | 2012 |            |        |                             |                                   |                     |                  |                         |                      | 100.0          |
    +------+------------+--------+-----------------------------+-----------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    14 rows in set
    """