class AddShippingAddrIdToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :shipping_addr_id, :integer
  end
end
