######
# Scenario: Search container
######

When /^I enter a valid search term$/ do
  pending
end

Then /^I see a the search results container appear$/ do
  pending
end


######
# Scenario: Results types
######

When /^the search results container appears$/ do
  pending
end

Then /^I see the following search result types:$/ do |table|
  table.raw.each do |row|
    pending
  end
end


######
# Scenario: Category results
# Scenario: Manufacturer results
# Scenario: Product results
######

When /^I enter a popular search term$/ do
  pending
end

Then /^I see one or more (\w+) search results$/ do |results_type|
  pending
end

And /^for each (\w+) search result I see:$/ do |results_type, table|
  pending
end