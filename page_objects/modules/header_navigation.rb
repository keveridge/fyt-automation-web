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

end