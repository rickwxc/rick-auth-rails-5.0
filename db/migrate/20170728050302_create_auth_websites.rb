class CreateAuthWebsites < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_websites do |t|
      t.string :url
      t.string :sendfromemail
      t.string :replyemail
      t.string :shortname
      t.string :title
      t.text :descr
      t.string :mailapikey
      t.string :mailapiurl

      t.timestamps
    end
  end
end
