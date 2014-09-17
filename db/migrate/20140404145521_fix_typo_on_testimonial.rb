class FixTypoOnTestimonial < ActiveRecord::Migration
  def change
    rename_column :testimonials, :comapny, :company
  end
end
