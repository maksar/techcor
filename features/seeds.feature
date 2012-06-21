Feature: rake seed task
  In order to do technical coordination
  As a console user
  I want use seed rake task

  Background:
    When I have wide terminal

  Scenario: Generate seed data in database
    Given catalog filled by seeds script
    And empty format
    And empty criteria
    When I'm listing all projects in console
    Then console output should contain
    """
    2 rows in set
    """
