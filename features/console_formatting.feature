Feature: Listing projects in console
  In order to view projects by criteria
  As a console user
  I want to specify criteria and see list of the projects

  Background:
    Given two projects in catalog
      | name   | property | value |
      | first  | length   | 2     |
      | second | length   | 1     |
    And output format
      | column | expression                                 |
      | Name   | name                                       |
      | Length | 'Length: ' + property('length').value.to_s |

  Scenario: listing empty project catalog with empty criteria
    Given no projects in catalog
    And empty criteria
    When I'm listing all projects in console
    Then console output should look like:
    """
    0 rows in set
    """

  Scenario: listing empty project catalog with specified criteria
    Given no projects in catalog
    But criteria property('length').value == 1
    When I'm listing all projects in console
    Then console output should look like:
    """
    0 rows in set
    """

  Scenario: listing projects catalog with empty criteria
    Given empty criteria
    When I'm listing all projects in console
    Then console output should look like:
    """
    +--------+-------------+
    | Name   | Length      |
    +--------+-------------+
    | first  | Length: 2.0 |
    | second | Length: 1.0 |
    +--------+-------------+
    2 rows in set
    """

  Scenario: listing projects catalog with simple criteria
    Given criteria property('length').value == 1
    When I'm listing all projects in console
    Then console output should look like:
    """
    +--------+-------------+
    | Name   | Length      |
    +--------+-------------+
    | second | Length: 1.0 |
    +--------+-------------+
    1 row in set
    """

  Scenario: listing projects catalog with complex criteria
    Given criteria property('length').value == 1 || property('length').value == 2
    When I'm listing all projects in console
    Then console output should look like:
    """
    +--------+-------------+
    | Name   | Length      |
    +--------+-------------+
    | first  | Length: 2.0 |
    | second | Length: 1.0 |
    +--------+-------------+
    2 rows in set
    """




