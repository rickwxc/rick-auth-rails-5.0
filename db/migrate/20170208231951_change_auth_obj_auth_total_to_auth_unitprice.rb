class ChangeAuthObjAuthTotalToAuthUnitprice < ActiveRecord::Migration[5.0]
  def change
	  rename_column :auth_objs, :auth_total, :auth_unitprice
  end
end
