class CreateAuthCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_carts do |t|
      t.integer :auth_user_id
      t.string :auth_visitor_uuid
      t.integer :auth_obj_id
      t.string :auth_obj_model_name
      t.decimal :auth_obj_qty, precision: 10, scale: 2
      t.text :auth_obj_meta_json

      t.timestamps
    end
  end
end
