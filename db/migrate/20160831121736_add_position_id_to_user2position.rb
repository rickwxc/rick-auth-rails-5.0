class AddPositionIdToUser2position < ActiveRecord::Migration[5.0]
  def change
    add_column :user2positions, :position_id, :integer
  end
end
