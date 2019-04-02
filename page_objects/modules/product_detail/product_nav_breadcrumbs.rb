module ProductDetail

  module ProductNavBreadcrumbs

    # Verification methods

    def has_breadcrumb_nav?
      has_css? breadcrumb_nav_css
    end

    def has_breadcrumb_home?
      has_css? "#{breadcrumb_item_css} a", text: 'Home'
    end

    def has_breadcrumb_category?
      has_css? breadcrumb_category_css
    end

    def has_breadcrumb_productname?
      has_css? breadcrumb_productname_css
    end


    private

    # CSS methods

    def breadcrumb_nav_css
      'ol.breadcrumb'
    end

    def breadcrumb_item_css
      "#{breadcrumb_nav_css} li.breadcrumb-item"
    end

    def breadcrumb_category_css
      "#{breadcrumb_nav_css} span[itemprop='name']"
    end

    def breadcrumb_productname_css
      "#{breadcrumb_nav_css} span[itemprop='item'][itemtype='http://schema.org/Thing']"
    end

  end

end