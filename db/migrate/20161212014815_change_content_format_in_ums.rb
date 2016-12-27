class ChangeContentFormatInUms < ActiveRecord::Migration[5.0]
  def change
	  change_column(:ums, :content, :text)
  end
end
