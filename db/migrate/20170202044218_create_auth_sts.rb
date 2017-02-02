class CreateAuthSts < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_sts do |t|
      t.string :name
      t.integer :auth_gj_id

      t.timestamps
    end
  end
end
