class AddShowNameToAuthObjAttrType < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_obj_attr_types, :show_name, :string
  end
end
