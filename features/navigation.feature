Feature: Primary navigation

  Background:
    Given I'm on the home page

  Scenario: Navigation visible

    Then I must see the following navigation elements:
      | login     |
      | wishlist  |
      | cart      |


  Scenario: Login item

    When I click on the login navigation item
    Then I am taken to the login page


  Scenario: Wishlist item

    When I click on the wishlist navigation item
    Then I am taken to the wishlist page


  Scenario: Cart item

    When I click on the cart navigation item
    Then I see the cart panel appear


  Scenario: Close cart panel

    And the cart panel is displayed
    When I click outside of the cart panel
    Then the cart panel is no longer displayed
