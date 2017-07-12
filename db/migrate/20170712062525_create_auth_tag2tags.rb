class CreateAuthTag2tags < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tag2tags do |t|
      t.integer :ptag_id
      t.integer :ctag_id

      t.timestamps
    end
  end
end
