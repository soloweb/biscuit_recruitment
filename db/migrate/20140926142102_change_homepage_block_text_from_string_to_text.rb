class ChangeHomepageBlockTextFromStringToText < ActiveRecord::Migration
  def change
    change_column :homepage_blocks, :text, :text
  end
end
