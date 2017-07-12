class CreateAuthTag2objs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tag2objs do |t|
      t.string :model
      t.integer :auth_obj_id
      t.integer :auth_tag_id

      t.timestamps
    end
  end
end
