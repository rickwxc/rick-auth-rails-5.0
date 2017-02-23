class CreateAuthShippingrule2objs < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_shippingrule2objs do |t|
      t.string :model
      t.integer :auth_sel_shippingrule_id

      t.timestamps
    end
  end
end
