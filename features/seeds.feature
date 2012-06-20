Feature: rake seed task
  In order to do technical coordination
  As a console user
  I want use seed rake task

  Background:
    When I have wide terminal

  Scenario: Generate seed data in database
    When I work in "test" environment
    And I run `rake seed`
    And I run `tc list`
    Then the output should contain "2 rows in set"
