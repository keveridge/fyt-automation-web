# Force the session to quit after a scenario if you find this tag
Before '@new_session' do
  Capybara.current_session.driver.quit
end

# Force the resizing of a browser if it's a mobile test case
Before do
  Capybara.page.driver.browser.manage.window.resize_to(488, 640) if IS_MOBILE
end