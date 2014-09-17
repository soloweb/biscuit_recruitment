class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
    	t.string :applicant_first_name
    	t.string :applicant_last_name
    	t.string :applicant_email
      t.timestamps
    end
  end
end
