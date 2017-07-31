class CreateAuthObjAttrs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_obj_attrs do |t|
      t.string :model
      t.integer :obj_id
      t.integer :auth_meta_type_id
      t.string :value
      t.integer :idx

      t.timestamps
    end
  end
end
