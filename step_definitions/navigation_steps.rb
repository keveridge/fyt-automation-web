######
# Background
######

Given /^I'm on the (\w+) page$/ do |page|
  HomePage.new.navigate_to
end


######
# Scenario: Navigation visible
######

Then /^I must see the following navigation elements:$/ do |table|
  page = HomePage.new
  table.raw.each do |row|
    begin
      page.send("#{row.first}_nav")
    rescue NoMethodError
      raise "No selector method exists for the `#{row.first}` navigation element in the #{page.class.name} page object"
    end
  end
end


######
# Scenario: Login item
# Scenario: Wishlist item
######

When /^I click on the (\w+) navigation item$/ do |nav_item|
  HomePage.new.send("#{nav_item}_nav").click
end

Then /^I am taken to the (\w+) page$/ do |page|
  Object.const_get("#{page.capitalize}Page").new.verify
end


######
# Scenario: Cart item
######

Then /^I see the cart panel appear$/ do
  expect(HomePage.new.has_cart_container?).to be true
end


######
# Scenario: Close cart panel
######

And /^the cart panel is displayed$/ do
  HomePage.new.cart_nav.click
end

When /^I click outside of the cart panel$/ do
  HomePage.new.click_outside_cart_container
end

Then /^the cart panel is no longer displayed$/ do
  expect(HomePage.new.has_cart_container?).to be false
end


######
# Scenario: Open currency selector
######

When /^I click on the currency selector$/ do
  pending
end

Then /^I see the following currencies:$/ do |table|
  pending
end


######
# Scenario: Select a currency
######

When /^I select (\w+) as a currency$/ do |currency|
  pending
end

Then /^I see the prices are in (.)'s$/ do |currency_symbol|
  pending
end