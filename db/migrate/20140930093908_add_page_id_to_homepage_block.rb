class AddPageIdToHomepageBlock < ActiveRecord::Migration
  def change
    add_column :homepage_blocks, :page_id, :integer
  end
end
