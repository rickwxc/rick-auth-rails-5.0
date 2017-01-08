class CreateAuthOrdersts < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_ordersts do |t|
      t.string :auth_st
      t.text :auth_descr

      t.timestamps
    end
  end
end
