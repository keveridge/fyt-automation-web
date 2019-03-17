module HeaderNavigation

  # Selector methods

  def login_nav
    find_link 'Log in'
  end

  def wishlist_nav
    find_link 'Wishlist'
  end

  def cart_nav
    find '#topcartlink'
  end

  def currency_selector
    find "#{currency_selector_css} button"
  end


  # Service methods

  def click_outside_cart_container
    find('body').click if has_cart_container?
  end

  def select_currency(currency:)
    currency_selector.click
    find("#{currency_selector_css} a", text: currency).click
  end


  # Validation methods

  def has_cart_container?
    has_css?(cart_container_css)
  end

  def has_currency_selector_currency?(currency:)
    has_css? "#{currency_selector_css} a", text: currency
  end

  def has_prices_in_currency?(currency_symbol:)
    prices = find_all('span.actual-price')
    prices.select { |e| e.text[0] == currency_symbol }.count == prices.count
  end


  private

  # Private selector methods

  def cart_container_css
    'aside.flycart-container'
  end

  def currency_selector_css
    'div.currency-selector'
  end

end