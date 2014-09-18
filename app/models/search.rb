class Search < ActiveRecord::Base
  attr_accessor :location, :keywords, :salary

  def self.find_vacancies(category, type)
    vacancies = Vacancy.published
    vacancies = vacancies.where("vacancy_type = ?", type) if type.present?
    vacancies = vacancies.where("category_id = ?", category) if category.present?
    vacancies
  end
end
