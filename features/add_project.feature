Feature: Adding project
  In order to add new project
  As a console user
  I want to be able to do that

  Scenario: adding project
    Given no projects in catalog
    When I execute cli "add TC"
    Then the cli output should contain "Project TC was successfully added."
