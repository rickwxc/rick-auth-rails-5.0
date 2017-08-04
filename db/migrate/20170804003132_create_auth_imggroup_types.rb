class CreateAuthImggroupTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_imggroup_types do |t|
      t.string :name
      t.string :acckey

      t.timestamps
    end
  end
end
