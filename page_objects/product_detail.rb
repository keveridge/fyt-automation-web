require_relative 'page'
require_relative 'modules/product_detail/product_nav_breadcrumbs'
require_relative 'modules/product_detail/product_nav_tabs'


class ProductDetailPage < Page

  include ProductDetail::ProductNavTabs
  include ProductDetail::ProductNavBreadcrumbs
  include ProductDetail::ProductRelated

  # Verification methods

  def verify
    expect(page).to have_current_path(@page_path)

    # Can't verify if this is a product page using the path, so use the meta property instead
    Capybara.ignore_hidden_elements = false
    raise "#{@page_path} is not a product deails page" unless has_css? "meta[property='og:type'][content='product']"
    Capybara.ignore_hidden_elements = true # turn it back on
  end


  def has_product_name?
    find(product_name_css).text.length > 0
  end

  def has_product_short_description?
    find(product_short_description_css).text.length > 0
  end

  def has_product_availability?
    has_css? product_availability_css
  end

  def has_product_price?
    has_css? product_price_css
  end

  def has_add_to_cart_quantity?
    has_css? add_to_cart_quantity_css
  end

  def has_add_to_cart_button?
    has_css? add_to_cart_button_css
  end

  def has_add_to_wishlist_button?
    has_css? add_to_wishlist_button_css
  end

  def has_add_to_compare_list_button?
    has_css? add_to_cart_button_css
  end

  def has_email_a_friend_button?
    has_css? email_a_friend_button_css
  end


  private

  # CSS methods

  def product_details_container_css
    'div.product-details-page'
  end

  def product_name_css
    "#{product_details_container_css} h2[itemprop='name']"
  end

  def product_short_description_css
    "#{product_details_container_css} div.short-description"
  end

  def product_availability_css
    'div.availability'
  end

  def product_price_css
    'div.product-price'
  end

  def add_to_cart_quantity_css
    'input.qty-input'
  end

  def add_to_cart_button_css
    'button.add-to-cart-button'
  end

  def add_to_wishlist_button_css
    'button.add-to-wishlist-button'
  end

  def add_to_compare_list_button_css
    'button.add-to-compare-list-button'
  end

  def email_a_friend_button_css
    'button.email-a-friend-button'
  end

end