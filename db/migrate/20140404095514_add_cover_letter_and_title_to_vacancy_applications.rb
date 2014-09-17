class AddCoverLetterAndTitleToVacancyApplications < ActiveRecord::Migration
  def change
    add_column :vacancy_applications, :title, :string
    add_attachment :vacancy_applications, :cover_letter, :attachment
  end
end
