class AddDescrToAuthBundle < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_bundles, :descr, :text
  end
end
