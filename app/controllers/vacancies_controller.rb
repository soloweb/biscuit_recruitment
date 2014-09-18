class VacanciesController < ApplicationController
  def index
    if params[:category] || params[:type]
      session[:search_params] = {category: params[:category], type: params[:type]}
      
      search_results = Search.find_vacancies(params[:category], params[:type])
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
