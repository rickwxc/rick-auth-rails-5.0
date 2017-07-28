class AddStockQtyToAuthObj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_objs, :stock_qty, :integer
  end
end
