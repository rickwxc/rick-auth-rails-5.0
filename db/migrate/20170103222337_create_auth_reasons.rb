class CreateAuthReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_reasons do |t|
      t.string :long
      t.string :short
      t.string :descr
      t.integer :auth_reasonst_id

      t.timestamps
    end
  end
end
