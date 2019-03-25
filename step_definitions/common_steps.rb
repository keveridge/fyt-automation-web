######
# Feature: Main navigation -> Background
# Feature: Footer navigation -> Background
# Feature: Search autocomplete -> Background
# Feature: Product navigation -> Background
######

Given /^I'm on the (\w+) page$/ do |page|
  HomePage.new.navigate_to
end
