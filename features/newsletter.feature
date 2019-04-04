Feature: Newsletter

  Background:
    Given I'm on the home page


  Scenario: Newsletter banner visible

    Then I see the newsletter banner


  Scenario: Sign up with valid email address

    When I sign up with a valid email address
    Then I see a thank you and verfication email message


  Scenario: Sign up with an invalid email address

    When I sign up with an invalid email address
    Then I see an invalid email message