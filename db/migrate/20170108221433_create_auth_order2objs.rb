class CreateAuthOrder2objs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_order2objs do |t|
      t.integer :auth_order_id
      t.decimal :auth_total, precision: 10, scale: 2
      t.decimal :auth_gst, precision: 10, scale: 2
      t.integer :auth_obj_id
      t.string :auth_obj_model_name
      t.string :auth_obj_display_name
      t.decimal :auth_obj_qty, precision: 10, scale: 2
      t.decimal :auth_obj_unitprice, precision: 10, scale: 2
      t.text :auth_obj_meta_json

      t.timestamps
    end
  end
end
