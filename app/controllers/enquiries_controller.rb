class EnquiriesController < ApplicationController
  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      flash[:success] = 'Your message has been received, we will be in touch shortly.'
      redirect_to root_path
    else
      flash[:error] = 'There was a problem sending your message'
      render action: :new
    end
  end

  private
  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :message)
  end
end
