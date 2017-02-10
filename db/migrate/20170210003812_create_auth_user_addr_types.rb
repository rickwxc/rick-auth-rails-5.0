class CreateAuthUserAddrTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_user_addr_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
