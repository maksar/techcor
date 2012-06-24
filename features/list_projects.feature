Feature: Listing projects in console
  In order to view projects by criteria
  As a console user
  I want to specify criteria and see list of the projects

  Scenario: listing empty project catalog with empty criteria
    Given no projects in catalog
    When I execute cli "list --fm "{'Name' => 'name', 'Count' => '\\'Count: \\' + property(\\'Unit Tests Count\\').last_value.to_s'}" "
    Then the cli output should contain "0 rows in set"

  Scenario: listing empty project catalog with specified criteria
    Given no projects in catalog
    When I execute cli "list --fm "{'Name' => 'name', 'Count' => '\\'Count: \\' + property(\\'Unit Tests Count\\').last_value.to_s'}" "property('Unit Tests Count').last_value == 1""
    Then the cli output should contain "0 rows in set"

  Scenario: listing projects catalog with empty criteria
    Given catalog filled by seeds script
    When I execute cli "list --fm "{'Name' => 'name', 'Count' => '\\'Count: \\' + property(\\'Unit Tests Count\\').last_value.to_s'}" "
    Then the cli output should contain:
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
    Given catalog filled by seeds script
    When I execute cli "list --fm "{'Name' => 'name', 'Count' => '\\'Count: \\' + property(\\'Unit Tests Count\\').last_value.to_s'}" "property('Unit Tests Count').last_value == 6""
    Then the cli output should contain:
    """
    +----------+------------+
    | Name     | Count      |
    +----------+------------+
    | Anagrams | Count: 6.0 |
    +----------+------------+
    1 row in set
    """

  Scenario: listing projects catalog with complex criteria
    Given catalog filled by seeds script
    When I execute cli "list --fm "{'Name' => 'name', 'Count' => '\\'Count: \\' + property(\\'Unit Tests Count\\').last_value.to_s'}" "property('Unit Tests Count').last_value == 6 || property('Unit Tests Count').last_value == 100""
    Then the cli output should contain:
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
    Given catalog filled by seeds script
    When I execute cli "list"
    Then the cli output should contain:
    """
    +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
    | Name     | Technology | Active | SCM                               | CI                                      | Unit Tests Coverage | Unit Tests Count | Tests Coverage | Cucumber Tests Coverage | Cucumber Tests Count |
    +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
    | Anagrams | Ruby       | false  | http://github.com/maksar/anagrams | http://travis-ci.org/#!/maksar/anagrams | 100.0               | 6.0              | 100.0          |                         |                      |
    | TC       | Ruby       | true   | http://github.com/maksar/techcor  | http://travis-ci.org/#!/maksar/techcor  | 100.0               | 100.0            | 100.0          | 92.68                   | 10.0                 |
    +----------+------------+--------+-----------------------------------+-----------------------------------------+---------------------+------------------+----------------+-------------------------+----------------------+
    2 rows in set
    """