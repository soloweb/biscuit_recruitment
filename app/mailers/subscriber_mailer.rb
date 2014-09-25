class SubscriberMailer < ActionMailer::Base
  default from: 'newsletter@biscuitrecruitment.co.uk'

  def confirmation_email(subscriber_email)
    @subscriber_email = subscriber_email
    mail(
      to: @subscriber_email, 
      subject: 'You have been signed up to the C&C Search newsletter', 
      body: 'If you did not sign up to this newsletter please contact us at info@biscuitrecruitment.co.uk to be removed from the mailing list'
    )
  end
end
