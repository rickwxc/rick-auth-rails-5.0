class AddUnitNoToAuthAddr < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_addrs, :unit_no, :string
  end
end
