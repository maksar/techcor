Feature: rake seed task
  In order to do technical coordination
  As a console user
  I want use seed rake task

  Scenario: Generate seed data in database
    Given catalog filled by seeds script
    When I execute cli "list"
    Then the cli output should contain "2 rows in set"
