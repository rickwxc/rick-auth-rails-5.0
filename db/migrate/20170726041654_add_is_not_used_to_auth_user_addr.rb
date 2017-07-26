class AddIsNotUsedToAuthUserAddr < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_user_addrs, :is_not_used, :boolean
  end
end
