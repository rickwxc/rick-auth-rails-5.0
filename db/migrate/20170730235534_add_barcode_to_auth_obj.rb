class AddBarcodeToAuthObj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_objs, :barcode, :string
  end
end
