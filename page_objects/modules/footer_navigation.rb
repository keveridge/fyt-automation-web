module FooterNavigation

  def has_footer_navigation?(item:)
    has_css? 'footer div#footer-block-information li', text: item
  end

end