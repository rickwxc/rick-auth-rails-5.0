class CreateAuthReasonsts < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_reasonsts do |t|
      t.string :st

      t.timestamps
    end
  end
end
