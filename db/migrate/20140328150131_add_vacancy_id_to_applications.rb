class AddVacancyIdToApplications < ActiveRecord::Migration
  def change
    add_column :vacancy_applications, :vacancy_id, :integer
  end
end
