class AddBarcodeToAuthOrder2obj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_order2objs, :barcode, :string
  end
end
