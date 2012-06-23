Feature: Listing projects in console
  In order to view projects by criteria
  As a console user
  I want to specify criteria and see list of the projects

  Background:
    Given output format
      | column | expression                                          |
      | Name   | name                                                |
      | Count  | 'Count: ' + property('Unit Tests Count').value.to_s |

  Scenario: Empty catalog
    Given no projects in catalog

    Scenario: listing empty project catalog with empty criteria
      And empty criteria
      When I'm listing all projects in console
      Then console output should look like
      """
      0 rows in set
      """

    Scenario: listing empty project catalog with specified criteria
      And criteria property('Unit Tests Count').value == 1
      When I'm listing all projects in console
      Then console output should look like
      """
      0 rows in set
      """

  Scenario: Catalog filled by seed script
    Given catalog filled by seeds script

    Scenario: listing projects catalog with empty criteria
      And empty criteria
      When I'm listing all projects in console
      Then console output should look like
      """
      +----------+--------------+
      | Name     | Count        |
      +----------+--------------+
      | Anagrams | Count: 6.0   |
      | TC       | Count: 100.0 |
      +----------+--------------+
      2 rows in set
      """

    Scenario: listing projects catalog with simple criteria
      And criteria property('Unit Tests Count').value == 6
      When I'm listing all projects in console
      Then console output should look like
      """
      +----------+------------+
      | Name     | Count      |
      +----------+------------+
      | Anagrams | Count: 6.0 |
      +----------+------------+
      1 row in set
      """

    Scenario: listing projects catalog with complex criteria
      And criteria property('Unit Tests Count').value == 6 || property('Unit Tests Count').value == 100
      When I'm listing all projects in console
      Then console output should look like
      """
      +----------+--------------+
      | Name     | Count        |
      +----------+--------------+
      | Anagrams | Count: 6.0   |
      | TC       | Count: 100.0 |
      +----------+--------------+
      2 rows in set
      """

    Scenario: listing projects catalog with empty format
      And empty criteria
      And empty format
      When I'm listing all projects in console
      Then console output should look like
      """
      +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
      | Name     | Technology | Active | SCM                               | CI                                      | Unit Tests Coverage | Unit Tests Count | Tests Coverage | Cucumber Tests Coverage | Cucumber Tests Count |
      +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
      | Anagrams | Ruby       | false  | http://github.com/maksar/anagrams | http://travis-ci.org/#!/maksar/anagrams | 100.0               | 6.0              | 100.0          |                         |                      |
      | TC       | Ruby       | true   | http://github.com/maksar/tc       | http://travis-ci.org/#!/maksar/tc       | 100.0               | 100.0            | 100.0          | 92.68                   | 10.0                 |
      +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
      2 rows in set
      """