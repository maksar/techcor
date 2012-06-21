Feature: Property history
  In order to view property history
  As a console user
  I want to specify property(ies) and see its history

  Background:
    Given catalog filled by seeds script
    And date format "----"

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
    | ---- | 40.0             |
    | ---- | 45.0             |
    | ---- | 60.0             |
    | ---- | 100.0            |
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
    | ---- | Ruby       |        |                             |                                   |                     |                  |                         |                      |                |
    | ---- |            | true   |                             |                                   |                     |                  |                         |                      |                |
    | ---- |            |        | http://github.com/maksar/tc |                                   |                     |                  |                         |                      |                |
    | ---- |            |        |                             | http://travis-ci.org/#!/maksar/tc |                     |                  |                         |                      |                |
    | ---- |            |        |                             |                                   | 98.55               |                  |                         |                      |                |
    | ---- |            |        |                             |                                   | 99.0                |                  |                         |                      |                |
    | ---- |            |        |                             |                                   | 100.0               |                  |                         |                      |                |
    | ---- |            |        |                             |                                   |                     | 40.0             |                         |                      |                |
    | ---- |            |        |                             |                                   |                     | 45.0             |                         |                      |                |
    | ---- |            |        |                             |                                   |                     | 60.0             |                         |                      |                |
    | ---- |            |        |                             |                                   |                     | 100.0            |                         |                      |                |
    | ---- |            |        |                             |                                   |                     |                  | 92.68                   |                      |                |
    | ---- |            |        |                             |                                   |                     |                  |                         | 10.0                 |                |
    | ---- |            |        |                             |                                   |                     |                  |                         |                      | 100.0          |
    +------+------------+--------+-----------------------------+-----------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    14 rows in set
    """