Feature: Footer navigation

  Background:
    Given I'm on the home page


  Scenario: Navigation visible

    Then I must see the following footer navigation elements:
      | Information | Sitemap                   |
      | Information | Shipping & returns        |
      | Information | Privacy notice            |
      | Information | Conditions of Use         |
      | Information | About us                  |
      | Information | Contact us                |
      | Information | Search                    |
      | Information | News                      |
      | Information | Blog                      |
      | Information | Recently viewed products  |
      | Information | Compare products list     |
      | Information | New products              |
      | My Account  | My account                |
      | My Account  | Orders                    |
      | My Account  | Addresses                 |
      | My Account  | Cart                      |
      | My Account  | Wishlist                  |
      | My Account  | Apply for vendor account  |

