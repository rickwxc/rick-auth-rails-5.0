class CreateAuthBundle2objs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_bundle2objs do |t|
      t.integer :auth_bundle_id
      t.integer :auth_obj_id
      t.string :auth_obj_model_name

      t.timestamps
    end
  end
end
