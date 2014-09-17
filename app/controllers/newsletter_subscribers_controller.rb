class NewsletterSubscribersController < ApplicationController
  def create
    @subscriber = NewsletterSubscriber.new(subscriber_params)
    if NewsletterSubscriber.find_by_email(subscriber_params[:email])
      flash[:error] = "#{@subscriber.email} is already signed up to the newsletter"
    else
      if @subscriber.save
        flash[:success] = "#{@subscriber.email} has been signed up to the newsletter"
      else
        flash[:error] = "#{@subscriber.email} is not a valid email address"
      end
    end
    redirect_to :back
  end

  private
  def subscriber_params
    params.require(:newsletter_subscriber).permit(:email)
  end
end