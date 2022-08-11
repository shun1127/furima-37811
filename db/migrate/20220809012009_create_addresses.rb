class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order_detail, null: false, foreign_key: true
      t.string :post_code, null: false
      t.integer :delivery_area_id, null: false
      t.string :city, null: false
      t.string :address_one, null: false
      t.string :address_two
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
