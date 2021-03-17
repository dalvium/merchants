class DefaultAdmin < ActiveRecord::Migration[6.1]
  def up
    Merchant.create(email: 'default@admin.com', password: 'secretpass123', role: 1)
  end
end
