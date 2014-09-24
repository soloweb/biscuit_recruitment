class AddTelephoneToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :telephone, :string
  end
end
