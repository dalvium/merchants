class AddRoleToMerchants < ActiveRecord::Migration[6.1]
  def change
    add_column :merchants, :role, :integer, default: 0
  end
end
