class AddDescrToImg < ActiveRecord::Migration[5.0]
  def change
    add_column :imgs, :descr, :text
  end
end
