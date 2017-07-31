class CreateAuthObjAttrGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_obj_attr_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
