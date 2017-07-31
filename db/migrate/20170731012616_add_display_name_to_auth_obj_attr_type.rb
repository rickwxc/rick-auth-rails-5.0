class AddDisplayNameToAuthObjAttrType < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_obj_attr_types, :display_name, :name
  end
end
