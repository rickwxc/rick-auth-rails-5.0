class AddAuthShippingCostToAuthOrder2obj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_order2objs, :auth_shipping_cost, :decimal, precision: 10, scale: 2
  end
end
