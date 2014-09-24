class RemoveHeaderBackgroundFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :header_background
  end
end
