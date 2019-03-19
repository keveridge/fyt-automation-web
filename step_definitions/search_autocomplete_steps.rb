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
  Page.new.autocomplete_search(search_terms: TestData::search_term(type: :valid))
end

Then /^I see the following search result types:$/ do |table|
  page = Page.new
  table.raw.each do |row|
    expect(page.has_autocomplete_results_type?(type:row.first)).to be true
  end
end


######
# Scenario: Category results
# Scenario: Manufacturer results
# Scenario: Product results
######

Then /^I see one or more (\w+) search results$/ do |results_type|
  expect(Page.new.autocomplete_search_results(type:results_type).count).to be > 0
end

And /^for each (\w+) search result I see:$/ do |results_type, table|
  page = Page.new
  page.autocomplete_search_results(type:results_type).each do |result|
    table.raw.each do |row|
      expect(page.has_autocomplete_search_result_element?(result:result, type:results_type, element:row.first)).to be true
    end
  end
end