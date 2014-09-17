class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :menu
      t.string :link
      t.integer :page_id
      t.timestamps
    end
  end
end
