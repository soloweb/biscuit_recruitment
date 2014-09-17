class VacanciesController < ApplicationController
  def index
    if params[:location] || params[:keywords] || params[:salary] || params[:type]
      session[:search_params] = {location: params[:location], keywords: params[:keywords], salary: params[:salary], type: params[:type]}
      search_results = Search.find_vacancies(params[:location], params[:keywords], params[:salary], params[:type])
      @results_count = search_results.count
      @vacancies = search_results.page(params[:page]).per(5)
    else
      @vacancies = Vacancy.published.page(params[:page]).per(5)
      session[:search_params] = nil
    end
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end
end
