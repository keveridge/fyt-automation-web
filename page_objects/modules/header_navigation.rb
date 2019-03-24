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

  def mobile_menu_button
    find mobile_menu_button_css
  end

  def mobile_menu_panel
    find mobile_menu_panel_css
  end


  # Service methods

  def click_outside_cart_container

    # The main area is offset by 15% of the screen width when the cart is displayed, so we use 20% to be sure

    main_width = element_width(css:modal_dismiss_css)
    x = (main_width * 1.2) - main_width

    find(modal_dismiss_css).click({       # Click to the far left of the main container
                                      x: x.round,
                                      y: 1
                                  })
  end

  def click_outside_mobile_menu
    find(modal_dismiss_css).click({       # Click to the far right of the main container
                                      x: (element_width(css:modal_dismiss_css)-5),
                                      y: 1
                                  })
  end

  def click_currency_selector
    mobile_menu_button.click if IS_MOBILE # Open the menu if we're using on a mobile device
    currency_selector.click
  end

  def select_currency(currency:)
    click_currency_selector
    find("#{currency_selector_css} a", text: currency).click
  end


  # Validation methods

  def has_main_navigation?(item:)
    has_css? 'header nav a.nav-link span', text: item
  end

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

  def mobile_menu_button_visible?
    has_css? mobile_menu_button_css
  end

  def mobile_menu_panel_visible?
    has_css? mobile_menu_panel_css
  end

  private

  # Private selector methods

  def cart_container_css
    'aside.flycart-container'
  end

  def currency_selector_css
    'div.currency-selector'
  end

  def mobile_menu_button_css
    '#mobile-menu-opener'
  end

  def mobile_menu_panel_css
    '#left'
  end

  def modal_dismiss_css
    'main'
  end

  def element_width(css:)
    page.evaluate_script("$('#{css}')[0].clientWidth").to_i # Use JavaScript to get element width using a css selector
  end

end