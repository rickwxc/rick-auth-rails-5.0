class AddInStockDateToAuthObj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_objs, :in_stock_date, :date
  end
end
