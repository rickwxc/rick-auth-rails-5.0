class CreateAuthCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_coupons do |t|
      t.string :code
      t.string :name
      t.decimal :val, precision: 10, scale: 2
      t.date :expire_at
      t.boolean :is_enabled

      t.timestamps
    end
  end
end
