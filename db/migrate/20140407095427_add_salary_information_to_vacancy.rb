class AddSalaryInformationToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :salary_information, :string
  end
end
