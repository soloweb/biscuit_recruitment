class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
    	t.string :title
    	t.string :comapny
    	t.float :salary
    	t.text :description
      t.timestamps
    end
  end
end
