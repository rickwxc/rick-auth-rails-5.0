class CreateAuthTags < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tags do |t|
      t.string :name
      t.integer :auth_tagtype_id

      t.timestamps
    end
  end
end
