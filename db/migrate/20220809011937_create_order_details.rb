class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
