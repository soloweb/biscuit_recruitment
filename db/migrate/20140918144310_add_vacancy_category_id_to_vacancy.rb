class AddVacancyCategoryIdToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :vacancy_category_id, :integer
  end
end
