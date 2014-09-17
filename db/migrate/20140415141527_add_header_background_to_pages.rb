class AddHeaderBackgroundToPages < ActiveRecord::Migration
  def change
    add_column :pages, :header_background, :string
  end
end
