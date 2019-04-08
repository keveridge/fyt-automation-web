Feature: Apparel Navigation

  Background:
    Given I am on the Apparel page

  Scenario: Selecting the 3rd item on the shop
    When I click on the 3rd item
    Then I am taken to a new product page