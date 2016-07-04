class CreateUms < ActiveRecord::Migration[5.0]
  def change
    create_table :ums do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.string :provider

      t.timestamps
    end
  end
end
