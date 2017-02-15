class AddAuthTotalOrgToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :auth_total_org, :decimal, precision: 10, scale: 2
  end
end
