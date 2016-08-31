class RemovePositionFromUser2position < ActiveRecord::Migration[5.0]
  def change
    remove_column :user2positions, :position, :integer
  end
end
