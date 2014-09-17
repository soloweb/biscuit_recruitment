class RenameOrderToMenuOrder < ActiveRecord::Migration
  def change
    rename_column :menu_items, :order, :menu_order
  end
end
