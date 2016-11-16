class AddControllernameToPosition2permission < ActiveRecord::Migration[5.0]
  def change
    add_column :position2permissions, :controllername, :string
  end
end
