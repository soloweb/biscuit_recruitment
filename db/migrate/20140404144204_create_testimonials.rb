class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author
      t.string :comapny
      t.text :content
      t.timestamps
    end
  end
end
