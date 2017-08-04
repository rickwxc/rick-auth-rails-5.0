class CreateAuthImggroups < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_imggroups do |t|
      t.string :name
      t.integer :auth_imggroup_type_id
      t.integer :maximg
      t.integer :obj_id
      t.string :model

      t.timestamps
    end
  end
end
