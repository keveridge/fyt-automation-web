require_relative '../page_objects/homepage'
require_relative '../page_objects/product_detail'

######
# Feature: Main navigation -> Background
# Feature: Footer navigation -> Background
# Feature: Search autocomplete -> Background
# Feature: Product navigation -> Background
# Feature: Product details -> Background
######

Given /^I'm on (?:the|a) ([\w ]+) page$/ do |page|
  if page == 'product detail'
    Task.get_product_page.navigate_to
  else
    Object.const_get("#{page.capitalize}Page").new.navigate_to
  end
  # TODO: Refactor to handle a product page
end
