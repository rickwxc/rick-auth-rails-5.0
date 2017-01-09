class CreateAuthInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_invoices do |t|
      t.string :uuid
      t.decimal :gross, precision: 10, scale: 2
      t.decimal :fee, precision: 10, scale: 2
      t.integer :auth_order_id
      t.integer :auth_paymethod_id
      t.integer :auth_invoicest_id

      t.timestamps
    end
  end
end
