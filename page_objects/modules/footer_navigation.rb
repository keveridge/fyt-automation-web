module FooterNavigation

  def has_footer_navigation?(section:, item:)
    has_css? "footer div#footer-block-#{section == 'Information' ? 'information' : 'my-account'} li", text: item
  end

end