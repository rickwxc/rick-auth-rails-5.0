class CreatePosition2permissions < ActiveRecord::Migration[5.0]
  def change
    create_table :position2permissions do |t|
      t.integer :position_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
