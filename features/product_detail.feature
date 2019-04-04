Feature: Product detail

  Background:
    Given I'm on a product detail page


  Scenario: Breadcrumb navigation

    Then I see breadcrumb navigation
    And the breadcrumb navigation contains:
      | a link to the homepage  |
      | one or more categories  |
      | the name of the product |


  Scenario: Main product details

    Then I see the following product details:
      | name                |
      | short description   |
      | availability        |
      | price               |


  Scenario: Product CTAs

    Then I see the following calls to action:
      | add to cart quantity  |
      | add to cart           |
      | add to wishlist       |
      | add to compare        |
      | email a friend        |


  Scenario: Product tabs

    Then I see the following product navigation tabs:
      | description   |
      | product tags  |
      | reviews       |
      | contact us    |


  Scenario: Description tab

    When I click the description tab
    Then I see the long description


  Scenario: Product tags tab

    When I click the product tags tab
    Then I see one or more product tags


  Scenario: Reviews tag

    When I click the reviews tab
    Then I see an add review button
    And the number of reviews matches the count on the tab


  Scenario: Contact tag

    When I click the contact us tab
    Then I see the following form elements:
      | email address |
      | name          |
      | phone         |
      | message       |
      | send button   |


  Scenario: Related products

    Then I see a 1 or more related products
    And I see the following for each related product:
      | image                       |
      | add to cart button          |
      | quick view button           |
      | add to compare list button  |
      | add to wishlist button      |
      | name                        |
      | review score                |
      | price                       |

