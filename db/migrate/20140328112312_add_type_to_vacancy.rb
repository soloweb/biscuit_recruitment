class AddTypeToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :type, :string
  end
end
