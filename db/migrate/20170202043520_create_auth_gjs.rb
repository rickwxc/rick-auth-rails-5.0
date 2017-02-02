class CreateAuthGjs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_gjs do |t|
      t.string :name

      t.timestamps
    end
  end
end
