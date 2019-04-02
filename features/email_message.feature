Feature: Email error message

  Background:
    Given I am on the home page

  Scenario: Incorrect Email
    When I enter an incorrect email
    Then I should see a error message

  Scenario: Correct Email
    When I enter a correct email address
    And I click on the submit button
    Then I should see a confirmation message

