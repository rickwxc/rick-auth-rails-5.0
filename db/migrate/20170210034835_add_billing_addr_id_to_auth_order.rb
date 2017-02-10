class AddBillingAddrIdToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :billing_addr_id, :integer
  end
end
