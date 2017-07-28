class RemoveAuthTagtypeIdFromAuthTag < ActiveRecord::Migration[5.0]
  def change
    remove_column :auth_tags, :auth_tagtype_id, :integer
  end
end
