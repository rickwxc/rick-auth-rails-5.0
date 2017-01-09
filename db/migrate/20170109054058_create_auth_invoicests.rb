class CreateAuthInvoicests < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_invoicests do |t|
      t.string :auth_st

      t.timestamps
    end
  end
end
