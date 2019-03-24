Feature: Main navigation

  Background:
    Given I'm on the home page


  Scenario: Navigation visible

    Then I must see the following navigation elements:
      | Log in     |
      | Wishlist  |
      | Cart      |


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

    
  @desktop
  Scenario: Open currency selector

    When I click on the currency selector
    Then I see the following currencies:
      | USD |
      | EUR |


  @mobile
  Scenario: Open currency selector

     And I click on the menu button
     When I click on the currency selector
     Then I see the following currencies:
       | USD |
       | EUR |


  Scenario Outline: Select a currency

    When I select <currency> as a currency
    Then I see the featured products prices are in <currency_symbol>'s

    Examples:
      | currency  | currency_symbol |
      | USD       | $               |
      | EUR       | €               |
