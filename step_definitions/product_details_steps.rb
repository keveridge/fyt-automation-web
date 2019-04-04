######
# Scenario: Breadcrumb navigation
######

Then /^I see breadcrumb navigation$/ do
  expect(Task.get_product_page.has_breadcrumb_nav?).to be true
end

And /^the breadcrumb navigation contains:$/ do |table|
  Task.validate_table(page:Task.get_product_page,
                      table:table,
                      method_hash:{
                          'a link to the homepage' => 'has_breadcrumb_home?',
                          'one or more categories' => 'has_breadcrumb_category?',
                          'the name of the product' => 'has_breadcrumb_productname?'
                      })
end


######
# Scenario: Main product details
######

Then /^I see the following product details:$/ do |table|
  Task.validate_table(page:Task.get_product_page,
                      table:table,
                      method_hash:{
                          'name' => 'has_product_name?',
                          'short description' => 'has_product_short_description?',
                          'availability' => 'has_product_availability?',
                          'price' => 'has_product_price?'
                      })
end


######
# Scenario: Product CTAs
######

Then /^I see the following calls to action:$/ do |table|
  Task.validate_table(page:Task.get_product_page,
                      table:table,
                      method_hash:{
                                       'add to cart quantity' => 'has_add_to_cart_quantity?',
                                       'add to cart' => 'has_add_to_cart_button?',
                                       'add to wishlist' => 'has_add_to_wishlist_button?',
                                       'add to compare' => 'has_add_to_compare_list_button?',
                                       'email a friend' => 'has_email_a_friend_button?',
                                   })
end


######
# Scenario: Product tabs
######

Then /^I see the following product navigation tabs:$/ do |table|
  page = Task.get_product_page
  table.raw.each do |row|
    raise "Could not find `#{row.first}` tab" unless page.has_product_nav_tab?(name:row.first)
  end
end


######
# Scenario: Description tab
# Scenario: Product tags tab
# Scenario: Reviews tag
# Scenario: Contact tag
######

When /^I click the ([\w ]+) tab$/ do |tab|
  Task.get_product_page.click_product_nav_tab(name:tab)
end


######
# Scenario: Description tab
######

Then /^I see the long description$/ do
  expect(Task.get_product_page.has_product_nav_tab_description_content?).to be true
end


######
# Scenario: Product tags tab
######

Then /^I see one or more product tags$/ do
  expect(Task.get_product_page.has_product_nav_tab_tags?).to be true
end


######
# Scenario: Reviews tag
######

Then /^I see an add review button$/ do
  expect(Task.get_product_page.has_product_nav_tab_review_add_review_btn?).to be true
end

And /^the number of reviews matches the count on the tab$/ do
  page = Task.get_product_page
  reviews_tab = page.product_nav_tab(name:'reviews')
  matches = reviews_tab.text.match(/\((\d+)\)/) # Search the text on the tab for a reviews count
  review_count = matches ? matches[1].to_i : 0 # Get the count
  expect(review_count).to eq page.no_of_reviews
end


######
# Scenario: Contact tag
######

Then /^I see the following form elements:$/ do |table|
  page = Task.get_product_page
  table.raw.each do |row|
    raise "Could not find `#{row.first}` field" unless page.has_product_nav_contact_field?(field:row.first)
  end
end


######
# Scenario: Related products
######

Then /^I see a (\d+) or more related products$/ do |quantity|
  page = Task.get_product_page
  expect(page.related_products.count).to be >= quantity
end

And /^I see the following for each related product:$/ do |table|
  page = Task.get_product_page

  table.raw.each do |row|
    method = {
        'image' => 'has_image?',
        'add to cart button' => 'has_add_to_cart_button?',
        'quick view button' => 'has_quick_view_button?',
        'add to compare list button' => 'has_compare_button?',
        'add to wishlist button' => 'has_wishlist_button?',
        'name' => 'has_name?',
        'review score' => 'has_review_score?',
        'price' => 'has_price?'
    }[row.first]

    page.related_products.each_with_index do |related_product, index|
      raise "Could not find `#{row.first}` for product: #{index}" unless related_product.send(method)
    end
  end
end