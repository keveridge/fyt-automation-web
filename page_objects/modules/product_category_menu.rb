module ProductCategoryMenu

  # Selector methods

  def main_product_nav_category(name:)
    find main_product_nav_category_css, text: name
  end


  # Data method

  def main_product_nav_category_label(name:)
    colors = {
        'badge-danger' => 'Red',
        'bg-success' => 'Green'
    }

    begin
      label = main_product_nav_category(name:name).sibling('label')
    rescue Capybara::ElementNotFound
      return nil # If there's no sibling label
    end

    classes = label[:class].split
    classes.delete('badge') # Labels have a badge class. The remaining class identifies the badge.
    {
        :color => colors[classes.first],
        :name => label.text
    }
  end

  # Validation methods

  def has_main_product_nav_category?(name:)
    has_css? main_product_nav_category_css, text: name
  end


  private

  # Private selector methods

  def main_product_nav_category_css
    IS_MOBILE ? '#left ul.navbar-nav a':'nav.mainNav li a'
  end

end