class CreateAuthWebsite2tags < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_website2tags do |t|
      t.integer :auth_website_id
      t.integer :auth_tag_id
      t.integer :idx

      t.timestamps
    end
  end
end
