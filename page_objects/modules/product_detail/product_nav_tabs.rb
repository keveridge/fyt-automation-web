module ProductDetail

  module ProductNavTabs

    # Selector methods

    def product_nav_tab(name:)
      text = (name == 'reviews') ? /REVIEWS \(\d+\)/ : name.upcase
      find(product_nav_tab_css, text: text)
    end


    # Service methods

    def click_product_nav_tab(name:)
      product_nav_tab(name:name).click
    end


    # Data methods

    def no_of_reviews
      begin
        find_all("#{product_nav_tab_description_content_css} div.product-review-item").count
      rescue Capybara::ElementNotFound
        0
      end
    end

    # Validation methods

    def has_product_nav_tab?(name:)
      has_css? product_nav_tab_css, text: name.upcase
    end

    def has_product_nav_tab_description_content?
      find(product_nav_tab_description_content_css).text.length > 0
    end

    def has_product_nav_tab_tags?
      has_css? "#{product_nav_tab_product_tags_content_css} a.producttag"
    end

    def has_product_nav_tab_review_content?
      has_css? product_nav_tab_review_content_css
    end

    def has_product_nav_tab_review_add_review_btn?
      has_css? product_nav_tab_review_add_review_button_css, text: 'Add your review'
    end

    def has_product_nav_tab_contact_content?
      has_css? product_nav_tab_contact_content_css
    end

    def has_product_nav_contact_field?(field:)
      has_css? product_nav_contact_field_css field: field
    end


    private

    # CSS Selectors

    def product_nav_tab_css
      'ul.nav-tabs li.nav-item'
    end

    def product_nav_tab_description_content_css
      '#product_tab_content'
    end

    def product_nav_tab_product_tags_content_css
      '#tags'
    end

    def product_nav_tab_review_content_css
      '#review'
    end

    def product_nav_tab_review_add_review_button_css
      "#{product_nav_tab_review_content_css} a.btn"
    end

    def product_nav_tab_contact_content_css
      '#contact'
    end

    def product_nav_contact_field_css(field:)
      {
          'email address' => '#AskQuestionEmail',
          'name' => '#AskQuestionFullName',
          'phone' => '#AskQuestionPhone',
          'message' => '#AskQuestionMessage',
          'send button' => 'input.send-ask-question-button',
      }[field]
    end

  end

end