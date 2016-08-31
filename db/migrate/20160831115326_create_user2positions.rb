class CreateUser2positions < ActiveRecord::Migration[5.0]
  def change
    create_table :user2positions do |t|
      t.integer :user_id
      t.integer :position

      t.timestamps
    end
  end
end
