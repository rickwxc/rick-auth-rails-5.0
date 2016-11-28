class CreateImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :imgs do |t|
      t.string :modelname
      t.integer :uuid
      t.integer :idx
      t.string :alt

      t.timestamps
    end
  end
end
