class AddClickUrlToImg < ActiveRecord::Migration[5.0]
  def change
    add_column :imgs, :click_url, :text
  end
end
