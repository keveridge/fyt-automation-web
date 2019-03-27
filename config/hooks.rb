# Force the session to quit after a scenario if you find this tag
Before '@new_session' do
  Capybara.current_session.driver.quit
end

Before do
  if IS_MOBILE # Force the resizing of a browser if it's a mobile test case
    Capybara.page.driver.browser.manage.window.resize_to(488, 640)
  else # Resize the window to maximum
    Capybara.page.driver.browser.manage.window.maximize
  end
end