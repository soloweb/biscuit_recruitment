class CreateVacancyCategories < ActiveRecord::Migration
  def change
    create_table :vacancy_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
