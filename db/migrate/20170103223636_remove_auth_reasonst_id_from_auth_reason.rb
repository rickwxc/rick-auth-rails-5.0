class RemoveAuthReasonstIdFromAuthReason < ActiveRecord::Migration[5.0]
  def change
    remove_column :auth_reasons, :auth_reasonst_id, :integer
  end
end
