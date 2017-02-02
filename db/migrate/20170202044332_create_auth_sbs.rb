class CreateAuthSbs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_sbs do |t|
      t.string :name
      t.string :zip
      t.integer :auth_st_id

      t.timestamps
    end
  end
end
