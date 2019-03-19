require_relative 'modules/header_navigation'
require_relative 'modules/search_autocomplete'
require_relative 'modules/footer_navigation'

class Page

  include RSpec::Matchers
  include Capybara::DSL

  include HeaderNavigation
  include FooterNavigation
  include SearchAutocomplete

  def initialize(page_path:nil)
    @page_path = page_path
  end


  # Navigation method

  def navigate_to
    visit @page_path
    disable_css_animations
    verify
  end


  # Verification methods

  def verify
    expect(page).to have_current_path(@page_path)
  end


  private

  def disable_css_animations
    # As selectors won't wait for animations to complete before executing, disable them.
    page.execute_script(File.read("#{BASE_DIR}/support/js/disable_animations.js"))
  end

end