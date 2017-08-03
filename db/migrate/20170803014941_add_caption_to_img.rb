class AddCaptionToImg < ActiveRecord::Migration[5.0]
  def change
    add_column :imgs, :caption, :text
  end
end
