class CreateAuthDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_discounts do |t|
      t.string :model
      t.integer :obj_id
      t.decimal :amt, precision: 10, scale: 2

      t.timestamps
    end
  end
end
