class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.string :email
      t.string :name
      t.string :city
      t.string :street
      t.string :country_code
      t.jsonb :extra

      t.timestamps
    end
  end
end
