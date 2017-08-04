class AddIndexToImg < ActiveRecord::Migration[5.0]
  def change
	  add_index :imgs, :modelname
	  add_index :imgs, :uuid
  end
end
