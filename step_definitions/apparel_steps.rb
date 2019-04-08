######
# Scenario: Apparel Multi-navigation
######

Given /^I'm on the (\w+) page$/ do |page|
  Apparel.new.navigate_to
end

When /^I click on the 3rd item$/ do
  original_path = current_path
  products = find_all 'div.card.gen'
  products[2].click
end

Then /^Then I am taken to a new product page$/ do
  products.first.click # Change the page
  expect(current_path).not_to eq(original_path) # Compre the old and new paths
end