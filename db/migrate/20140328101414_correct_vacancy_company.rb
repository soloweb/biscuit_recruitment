class CorrectVacancyCompany < ActiveRecord::Migration
  def change
  	rename_column :vacancies, :comapny, :company
  end
end
