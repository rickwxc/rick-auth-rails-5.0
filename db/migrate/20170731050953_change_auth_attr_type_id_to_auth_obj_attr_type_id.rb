class ChangeAuthAttrTypeIdToAuthObjAttrTypeId < ActiveRecord::Migration[5.0]
  def change
	  rename_column :auth_obj_attrs, :auth_attr_type_id, :auth_obj_attr_type_id
  end
end
