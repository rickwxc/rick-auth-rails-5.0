class RemovePermissionIdFromPosition2permission < ActiveRecord::Migration[5.0]
  def change
    remove_column :position2permissions, :permission_id, :integer
  end
end
