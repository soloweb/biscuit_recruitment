class AddOrderToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :order, :integer
  end
end
