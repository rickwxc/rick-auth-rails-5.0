class AddWebsiteIdToAuthOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_orders, :website_id, :integer
  end
end
