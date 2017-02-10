class RenameAuthUserAddrTypeToAuthUserAddrTypeId < ActiveRecord::Migration[5.0]
  def change
	  rename_column :auth_user_addrs, :auth_user_addr_type, :auth_user_addr_type_id
  end
end
