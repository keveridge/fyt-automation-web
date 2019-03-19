module SearchAutocomplete

  # Service methods

  def autocomplete_search(search_terms:)
    fill_in autocomplete_search_box_id, with: search_terms
  end


  # Validation methods

  def autocomplete_results_displayed?
    has_css? "\##{autocomplete_search_box_id}"
  end

  def has_autocomplete_results_type?(type:)
    has_css? 'ul.advanced-search-results a.title', text: type.capitalize
  end

  def has_autocomplete_search_result_element?(result:, type:, element:)
    result.has_css? autocomplete_search_result_element_css type:type, element:element
  end

  def autocomplete_search_results(type:)
    find_all autocomplete_search_result_css(type:type)
  end

  private

  def autocomplete_search_box_id
    'small-searchterms'
  end

  def autocomplete_search_result_css(type:)
    element = {
        :categories => 'li',
        :manufacturers => 'li',
        :products => 'ul'
    }[type.to_sym]
    "ul.advanced-search-results #{element}.#{type}-container li"
  end

  def autocomplete_search_result_element_css(type:, element:)
    {
        :categories => {
            'search term' => 'div.product-in',
            'category' => 'div.product-title'
        },
        :manufacturers => {
            'search term' => 'div.product-in',
            'manufacturer' => 'div.product-title'
        },
        :products => {
            'thumbnail' => 'img.d-inline-flex',
            'product name' => 'div.product-title',
            'product description' => 'div.product-desc'
        }
    }[type.to_sym][element]
  end

end