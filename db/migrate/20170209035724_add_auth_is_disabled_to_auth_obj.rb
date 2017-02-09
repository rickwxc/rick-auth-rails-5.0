class AddAuthIsDisabledToAuthObj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_objs, :auth_is_disabled, :boolean
  end
end
