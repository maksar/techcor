Feature: Edit property
  In order to edit property of the project
  As a console user
  I want to be able to do that

  Scenario: editing property
    Given catalog filled by seeds script
    When I execute cli "edit_property --pn TC --mn Technology RoR"
    Then the cli output should contain "Metric Technology in project TC now has value RoR."
