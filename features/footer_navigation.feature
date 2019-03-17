Feature: Footer navigation

  Background:
    Given I'm on the home page


  Scenario: Navigation visible

    Then I must see the following footer navigation elements:
      | Sitemap                   |
      | Shipping & returns        |
      | Privacy notice            |
      | Conditions of Use         |
      | About us                  |
      | Contact us                |
      | Search                    |
      | News                      |
      | Blog                      |
      | Recently viewed products  |
      | Compare products list     |
      | New products              |

