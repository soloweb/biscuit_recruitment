class RemoveSalaryFromVacancy < ActiveRecord::Migration
  def change
    remove_column :vacancies, :salary
  end
end
