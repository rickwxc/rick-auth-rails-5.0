class AddAuthBundleTypeIdToAuthBundle < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_bundles, :auth_bundle_type_id, :integer
  end
end
