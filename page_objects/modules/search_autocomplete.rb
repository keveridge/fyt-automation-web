module SearchAutocomplete

  # Service methods

  def autocomplete_search(search_terms:)
    fill_in autocomplete_search_box_id, with: search_terms
  end


  # Validation methods

  def autocomplete_results_displayed?
    has_css? "\##{autocomplete_search_box_id}"
  end


  private

  def autocomplete_search_box_id
    'small-searchterms'
  end

end