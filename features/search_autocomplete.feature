Feature: Search autocomplete

  Background:
    Given I'm on the homepage


  Scenario: Results container

    When I enter a valid search term
    Then I see a the search results container appear


  Scenario: Results types

    When the search results container appears
    Then I see the following search result types:
      | Categories    |
      | Manufacturers |
      | Products      |


  Scenario: Category results

    When I enter a popular search term
    Then I see one or more categories search results
    And for each categories search result I see:
      | search term |
      | category    |


  Scenario: Manufacturer results

    When I enter a popular search term
    Then I see one or more manufacturers search results
    And for each manufacturers search result I see:
      | search term   |
      | manufacturer  |


  Scenario: Product results

    When I enter a popular search term
    Then I see one or more products search results
    And for each products search result I see:
      | thumbnail           |
      | product name        |
      | product description |
