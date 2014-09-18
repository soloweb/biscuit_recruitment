class AddImageAndAlignmentToHomepageBlock < ActiveRecord::Migration
  def change
    add_attachment :homepage_blocks, :image
    add_column :homepage_blocks, :alignment, :string
  end
end
