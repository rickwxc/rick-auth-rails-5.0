class CreateAuthSelShippingrules < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_sel_shippingrules do |t|
      t.string :name
      t.decimal :cost, precision: 10, scale: 2
      t.integer :idx

      t.timestamps
    end
  end
end
