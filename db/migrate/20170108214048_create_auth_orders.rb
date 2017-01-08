class CreateAuthOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_orders do |t|
      t.integer :auth_user_id
      t.string :auth_visitor_uuid
      t.decimal :auth_total, precision: 10, scale: 2
      t.decimal :auth_gst, precision: 10, scale: 2
      t.integer :auth_orderst_id
      t.integer :auth_payst_id
      t.text :auth_note
      t.text :auth_meta_json

      t.timestamps
    end
  end
end
