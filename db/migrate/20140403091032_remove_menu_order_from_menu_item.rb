class RemoveMenuOrderFromMenuItem < ActiveRecord::Migration
  def change
    remove_column :menu_items, :menu_order
  end
end
