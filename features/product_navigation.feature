Feature: Product navigation

  Background:
    Given I'm on the home page


  Scenario: Main product navigation categories

    Then I should see the following product navigation categories:
      | Computers         |
      | Electronics       |
      | Apparel           |
      | Digital downloads |
      | Books             |
      | Jewelry           |
      | Gift Cards        |


  Scenario: Main product navigation category tags

    Then I should see the following categories and tags:
      | CATEGORY   | TAG_TEXT | TAG_COLOR |
      | Computers  | New      | Red       |
      | Books      | Promo!   | Green     |
