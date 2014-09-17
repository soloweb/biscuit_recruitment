class Search < ActiveRecord::Base
  attr_accessor :location, :keywords, :salary

  def self.find_vacancies(location, keywords, salary, type)
    vacancies = Vacancy.published
    vacancies = vacancies.near(location) if location.present?
    vacancies = vacancies.search_full_text(keywords) if keywords.present?
    if salary.to_s.gsub(/\D/, '').to_i != 0
      # remove pound sign too
      salary = salary.to_s.gsub('£', '').gsub(',', '').to_i
      vacancies = vacancies.where("salary >= ?", salary)
    end
    vacancies = vacancies.where("vacancy_type = ?", type) if type.present?
    vacancies
  end
end
