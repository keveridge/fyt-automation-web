### A class of static test data methods

# Given /^I'm on the (\w+) page$/ do |page|
 # HomePage.new.navigate_to
#end

#When I enter an incorrect email do
 #"#{ find('#newsletter-subscribe-button').click
  #Then I should see an error message
#end
###
#
# When I try to run the debug mode with this there is a failure in the syntax.
#
# Actions Taken:
When /^I enter an incorrect email$/ do
  fill_in 'newsletter-email', :with =>'timetofight' # this is to enter some incorrect email
  find('#newsletter-subscribe-button').click # This is to click the submit button
end