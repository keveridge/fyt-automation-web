# Quit the session after each scenario
After do
  Capybara.current_session.driver.quit
end