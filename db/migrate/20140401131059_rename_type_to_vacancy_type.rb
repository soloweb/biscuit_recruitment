class RenameTypeToVacancyType < ActiveRecord::Migration
  def change
    rename_column :vacancies, :type, :vacancy_type
  end
end
