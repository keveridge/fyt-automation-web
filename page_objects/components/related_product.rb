class RelatedProduct

  def initialize(element:)
    @element = element
  end

  # Validation methods

  def has_image?
    @element.has_css? image_css
  end

  def has_add_to_cart_button?
    @element.has_css? add_to_cart_button_css
  end

  def has_quick_view_button?
    @element.has_css? quick_view_button_css
  end

  def has_compare_button?
    @element.has_css? compare_button_css
  end

  def has_wishlist_button?
    @element.has_css? wishlist_button_css
  end

  def has_name?
    @element.has_css? name_css
  end

  def has_review_score?
    @element.has_css? review_container_css
  end

  def has_price?
    @element.has_css? price_css
  end


  private

  def image_css
    'img.card-img-top'
  end

  def add_to_cart_button_css
    'button span.add-cart-text'
  end

  def quick_view_button_css
    'button.btn-quick-view'
  end

  def compare_button_css
    "button[value='Add to compare list']"
  end

  def wishlist_button_css
    "button[value='Add to wishlist']"
  end

  def name_css
    'h3.card-title a'
  end

  def review_container_css
    'div.product-rating-box'
  end

  def price_css
    'span.actual-price'
  end


end