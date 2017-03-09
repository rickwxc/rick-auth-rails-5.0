class AddCanPickupToAuthUserAddr < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_user_addrs, :can_pickup, :boolean
  end
end
