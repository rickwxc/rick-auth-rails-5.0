class CreateAuthObjAttrTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_obj_attr_types do |t|
      t.string :name
      t.integer :auth_obj_attr_group_id
      t.integer :idx

      t.timestamps
    end
  end
end
