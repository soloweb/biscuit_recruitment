class SubscriberMailer < ActionMailer::Base
  default from: 'newsletter@candcsearch.co.uk'

  def confirmation_email(subscriber_email)
    @subscriber_email = subscriber_email
    mail(
      to: @subscriber_email, 
      subject: 'You have been signed up to the C&C Search newsletter', 
      body: 'If you did not sign up to this newsletter please contact us at info@candcsearch.co.uk to be removed from the mailing list'
    )
  end
end
