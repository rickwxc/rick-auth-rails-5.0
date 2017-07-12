class CreateAuthTagtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tagtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
