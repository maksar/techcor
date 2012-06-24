Feature: rake support
  In order to do technical coordination
  As a console user
  I want use rake tasks

  Scenario: View list of rake commands
    When I run `rake -T`
    And the output should contain rake command "default" with description "Run Cucumber & RSpec to generate aggregated coverage"
    And the output should contain rake command "cucumber" with description "Run Cucumber features"
    And the output should contain rake command "rspec" with description "Run RSpec code examples"
    And the output should contain rake command "seed" with description "Creates bunch of test data in database"
