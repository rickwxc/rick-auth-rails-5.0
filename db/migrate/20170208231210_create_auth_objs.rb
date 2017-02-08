class CreateAuthObjs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_objs do |t|
      t.string :auth_name
      t.string :auth_uuid
      t.text :auth_descr
      t.decimal :auth_total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
