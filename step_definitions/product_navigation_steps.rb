######
# Scenario: Main product navigation category tags
######

Then /^I should see the following product navigation categories:$/ do |table|
  page = Page.new
  page.mobile_menu_button.click if IS_MOBILE
  table.raw.each do |row|
    expect(page.has_main_product_nav_category? name: row.first).to be true
  end

end

Then /^I should see the following categories and tags:$/ do |table|
  page = Page.new
  page.mobile_menu_button.click if IS_MOBILE
  table.hashes.each do |row|
    label = page.main_product_nav_category_label(name:row['CATEGORY'])
    raise "No label found for product category `#{row['CATEGORY']}`" unless label
    expect(row['TAG_TEXT']).to eq(label[:name])
    expect(row['TAG_COLOR']).to eq(label[:color])
  end
end
