class AddAttachmentCvToVacancyApplications < ActiveRecord::Migration
  def self.up
    change_table :vacancy_applications do |t|
      t.attachment :cv
    end
  end

  def self.down
    drop_attached_file :vacancy_applications, :cv
  end
end
