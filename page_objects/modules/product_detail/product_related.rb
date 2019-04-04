require_relative '../../components/related_product'

module ProductDetail

  module ProductRelated

    # Selector methods

    def related_products
      find_all(related_products_css).map { |product| RelatedProduct.new(element:product) }
    end


    private

    # CSS methods

    def related_products_css
      'div.related-products-grid'
    end

  end

end