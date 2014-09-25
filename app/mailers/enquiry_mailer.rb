class EnquiryMailer < ActionMailer::Base
  default from: 'enquiries@biscuitrecruitment.co.uk'

  def notification_email(enquiry)
    @enquiry = enquiry
    mail(
      to: Enquiry::NOTIFY_EMAIL, 
      subject: 'New Website Enquiry'
    )
  end
end
