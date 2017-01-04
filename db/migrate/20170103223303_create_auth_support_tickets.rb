class CreateAuthSupportTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_support_tickets do |t|
      t.string :email
      t.string :mobile
      t.integer :user_id
      t.text :note
      t.text :meta

      t.timestamps
    end
  end
end
