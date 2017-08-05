class AddShippingCodeToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :shipping_code, :string
  end
end
