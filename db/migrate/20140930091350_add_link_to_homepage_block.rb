class AddLinkToHomepageBlock < ActiveRecord::Migration
  def change
    add_column :homepage_blocks, :link, :string
  end
end
