require_relative 'modules/header_navigation'

class Page

  include RSpec::Matchers
  include Capybara::DSL

  include HeaderNavigation

  def initialize(page_path:)
    @page_path = page_path
  end


  # Navigation method

  def navigate_to
    visit @page_path
    verify_page_load
  end


  # Verification methods

  def verify_page_load
    # Check that this page has header or footer tags
    begin
      find 'header'
      find 'footer'
    rescue
      raise 'Current page does not adhere to the expected site template or did not load correctly'
    end
  end

end