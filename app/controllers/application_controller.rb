class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :find_recent_vacancies

  private
  def find_recent_vacancies
    @recent_vacancies = Vacancy.order('created_at desc').limit(4)
  end
end
