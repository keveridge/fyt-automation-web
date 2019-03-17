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


  # Service methods

  def click_outside_cart_container
    find('body').click if has_cart_container?
  end

  # Validation methods

  def has_cart_container?
    has_css?(cart_container_css)
  end


  private

  # Private selector methods

  def cart_container_css
    'aside.flycart-container'
  end

end