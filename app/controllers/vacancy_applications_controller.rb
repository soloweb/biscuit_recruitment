class VacancyApplicationsController < ApplicationController
  def new
    @vacancy = Vacancy.find(params[:vacancy])
    @vacancy_application = VacancyApplication.new
  end

  def create
    @vacancy = Vacancy.find(vacancy_application_params[:vacancy_id])
    @vacancy_application = VacancyApplication.new(vacancy_application_params)
    if @vacancy_application.save
      flash[:success] = "Application received"
      redirect_to vacancy_path(@vacancy)
    else
      flash[:error] = "There was a problem submitting your application"
      render action: :new
    end
  end

  private
  def vacancy_application_params
    params.require(:vacancy_application).permit(:vacancy_id, :applicant_first_name, :applicant_last_name, :applicant_email, :cv, :cover_letter, :title)
  end
end
