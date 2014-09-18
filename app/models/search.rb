class Search < ActiveRecord::Base
  attr_accessor :location, :keywords, :salary

  def self.find_vacancies(location, keywords, type)
    vacancies = Vacancy.published
    vacancies = vacancies.near(location) if location.present?
    vacancies = vacancies.search_full_text(keywords) if keywords.present?
    vacancies = vacancies.where("vacancy_type = ?", type) if type.present?
    vacancies
  end
end
