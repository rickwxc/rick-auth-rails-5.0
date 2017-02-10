class CreateAuthUserAddrs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_user_addrs do |t|
      t.integer :auth_user_id
      t.string :auth_visitor_uuid
      t.integer :auth_user_addr_type
      t.integer :auth_addr_id
      t.string :firstname
      t.string :lastname
      t.string :mobile
      t.string :company

      t.timestamps
    end
  end
end
