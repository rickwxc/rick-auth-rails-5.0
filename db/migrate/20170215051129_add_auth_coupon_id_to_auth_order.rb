class AddAuthCouponIdToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :auth_coupon_id, :integer
  end
end
