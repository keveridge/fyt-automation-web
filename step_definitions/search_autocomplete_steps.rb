######
# Scenario: Search container
######

When /^I enter a (\w+) search term$/ do |search_term_type|
  Page.new.autocomplete_search(search_terms: TestData::search_term(type:search_term_type))
end

Then /^I see the search results container appear$/ do
  expect(Page.new.autocomplete_results_displayed?).to be true
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

Then /^I see one or more (\w+) search results$/ do |results_type|
  pending
end

And /^for each (\w+) search result I see:$/ do |results_type, table|
  pending
end