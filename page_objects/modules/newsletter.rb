module Newsletter

  # Selector methods

  def newsletter_subscribe_button
    find newsletter_subscribe_button_css
  end


  # Service methods

  def newsletter_signup(email:)
    fill_in newsletter_email_field_locator, with: email
    newsletter_subscribe_button.click
  end


  # Validation methods

  def has_newsletter_container?
    has_css? newsletter_container_css
  end

  def has_newletter_email_field?
    has_css? newsletter_email_input_css
  end

  def has_newsletter_subscribe_button?
    has_css? newsletter_subscribe_button_css
  end

  def has_newsletter_signup_succeeded?
    newsletter_signup_message.include? 'Thank you for signing up'
  end

  def has_newsletter_signup_failed?
    newsletter_signup_message.include? 'Enter valid email'
  end


  # Data method

  def newsletter_signup_message
    find(newsletter_email_submission_message_css).text
  end


  private

  def newsletter_email_field_locator
    'newsletter-email'
  end


  # CSS methods

  def newsletter_container_css
    '#newsletter-subscribe-block'
  end

  def newsletter_subscribe_button_css
    '#newsletter-subscribe-button'
  end

  def newsletter_email_submission_message_css
    '#newsletter-result-block'
  end

end