class CreateHomepageBlocks < ActiveRecord::Migration
  def change
    create_table :homepage_blocks do |t|
      t.string :title
      t.string :text
      t.integer :position
      t.timestamps
    end
  end
end
