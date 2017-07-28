class CreateAuthOrderShippingRules < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_order_shipping_rules do |t|
      t.text :name
      t.decimal :cost, precision: 10, scale: 2
      t.decimal :order_amt, precision: 10, scale: 2
      t.boolean :is_enabled

      t.timestamps
    end
  end
end
