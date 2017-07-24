class AddUuidToAuthOrder2obj < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_order2objs, :uuid, :string
  end
end
