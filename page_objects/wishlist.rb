require_relative 'page.rb'

class WishlistPage < Page

  def initialize()
    super(page_path:'/wishlist')
  end

end