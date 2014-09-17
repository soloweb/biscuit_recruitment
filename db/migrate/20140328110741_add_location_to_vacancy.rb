class AddLocationToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :location, :string
    add_column :vacancies, :latitude, :float
    add_column :vacancies, :longitude, :float
  end
end
