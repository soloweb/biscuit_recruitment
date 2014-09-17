class ChangeApplicationsToVacancyApplications < ActiveRecord::Migration
  def change
    rename_table :applications, :vacancy_applications
  end
end
