class CreateAuthAddrs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_addrs do |t|
      t.string :street_number
      t.string :street
      t.integer :auth_sb_id
      t.text :org
      t.text :raw_json

      t.timestamps
    end
  end
end
