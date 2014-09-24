class AddHeaderImageToPages < ActiveRecord::Migration
  def change
    add_attachment :pages, :header_image
  end
end
