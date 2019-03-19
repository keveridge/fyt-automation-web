# Force the session to quit after a scenario if you find this tag
Before '@new_session' do
  Capybara.current_session.driver.quit
end