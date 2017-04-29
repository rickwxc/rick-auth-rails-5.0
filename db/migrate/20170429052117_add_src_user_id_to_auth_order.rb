class AddSrcUserIdToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :src_user_id, :integer
  end
end
