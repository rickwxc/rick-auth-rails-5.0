class AddCodeToAuthOrderShippingRule < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_order_shipping_rules, :code, :string
  end
end
