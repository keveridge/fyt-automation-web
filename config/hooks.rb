# Force the session to quit after a scenario if you find this tag
Before '@new_session' do
  Capybara.current_session.driver.quit
end

Before do
  if ConfigData.driver.to_sym != :appium # Appium can't support these commands
    if IS_REMOTE # Resize the window to maximum if this is a remotely run test
      Capybara.page.driver.browser.manage.window.maximize
    end
  end
end