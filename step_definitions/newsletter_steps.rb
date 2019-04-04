######
# Scenario: Newsletter banner visible
######

Then /^I see the newsletter banner$/ do
  expect(Page.new.has_newsletter_container?).to be true
end


######
# Scenario: Sign up with valid email address
# Scenario: Sign up with an invalid email address
######

When /^I sign up with a(?:n)? (invalid|valid) email address$/ do |type|
  Page.new.newsletter_signup(email:TestData.email_address(type:type))
end


######
# Scenario: Sign up with valid email address
######

Then /^I see a thank you and verfication email message$/ do
  expect(Page.new.has_newsletter_signup_succeeded?).to be true
end


######
# Scenario: Sign up with an invalid email address
######

Then /^I see an invalid email message$/ do
  expect(Page.new.has_newsletter_signup_failed?).to be true
end