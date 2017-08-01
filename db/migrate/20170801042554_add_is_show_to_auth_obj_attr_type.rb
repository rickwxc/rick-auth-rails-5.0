class AddIsShowToAuthObjAttrType < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_obj_attr_types, :is_show, :boolean
  end
end
