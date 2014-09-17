class AddPublishedToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :published, :boolean, default: true
  end
end
