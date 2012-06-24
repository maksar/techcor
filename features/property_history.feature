Feature: Property history
  In order to view property history
  As a console user
  I want to specify property(ies) and see its history

  Background:
    Given catalog filled by seeds script

  Scenario: trying to list non-existing property
    When I execute cli "history --pn TC --df ---- "non existing property""
    Then the cli output should contain "0 rows in set"

  Scenario: listing property history
    When I execute cli "history --pn TC --df ---- "Unit Tests Count""
    Then the cli output should contain:
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
    When I execute cli "history --pn TC --df ----"
    Then the cli output should contain:
    """
    +------+------------+--------+----------------------------------+----------------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    | Date | Technology | Active | SCM                              | CI                                     | Unit Tests Coverage | Unit Tests Count | Cucumber Tests Coverage | Cucumber Tests Count | Tests Coverage |
    +------+------------+--------+----------------------------------+----------------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    | ---- | Ruby       |        |                                  |                                        |                     |                  |                         |                      |                |
    | ---- |            | true   |                                  |                                        |                     |                  |                         |                      |                |
    | ---- |            |        | http://github.com/maksar/techcor |                                        |                     |                  |                         |                      |                |
    | ---- |            |        |                                  | http://travis-ci.org/#!/maksar/techcor |                     |                  |                         |                      |                |
    | ---- |            |        |                                  |                                        | 98.55               |                  |                         |                      |                |
    | ---- |            |        |                                  |                                        | 99.0                |                  |                         |                      |                |
    | ---- |            |        |                                  |                                        | 100.0               |                  |                         |                      |                |
    | ---- |            |        |                                  |                                        |                     | 40.0             |                         |                      |                |
    | ---- |            |        |                                  |                                        |                     | 45.0             |                         |                      |                |
    | ---- |            |        |                                  |                                        |                     | 60.0             |                         |                      |                |
    | ---- |            |        |                                  |                                        |                     | 100.0            |                         |                      |                |
    | ---- |            |        |                                  |                                        |                     |                  | 92.68                   |                      |                |
    | ---- |            |        |                                  |                                        |                     |                  |                         | 10.0                 |                |
    | ---- |            |        |                                  |                                        |                     |                  |                         |                      | 100.0          |
    +------+------------+--------+----------------------------------+----------------------------------------+---------------------+------------------+-------------------------+----------------------+----------------+
    14 rows in set
    """