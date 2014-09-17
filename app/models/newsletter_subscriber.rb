class NewsletterSubscriber < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, :format => { :with => /.+@.+\..+/, :message => "Email address not valid" }
  after_save :send_confirmation

  ActiveAdmin.register NewsletterSubscriber do
    config.sort_order = "created_at_desc"
    actions :all, except: [:edit]
  end

  def send_confirmation
    SubscriberMailer.confirmation_email(self.email).deliver
  end
end
