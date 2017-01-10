class CreateAuthBundles < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_bundles do |t|
      t.string :auth_name
      t.decimal :auth_total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
