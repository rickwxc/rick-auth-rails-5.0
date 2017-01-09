class CreateAuthPaymethods < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_paymethods do |t|
      t.string :auth_name

      t.timestamps
    end
  end
end
