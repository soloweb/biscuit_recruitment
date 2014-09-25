class Enquiry < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  after_save :send_notification

  if Rails.env.production?
    NOTIFY_EMAIL = 'info@biscuitrecruitment.co.uk'
  else
    NOTIFY_EMAIL = 'jack@soloweb.com'
  end

  def send_notification
    EnquiryMailer.notification_email(self).deliver
  end
end
