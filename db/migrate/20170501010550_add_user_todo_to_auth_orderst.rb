class AddUserTodoToAuthOrderst < ActiveRecord::Migration[5.0]
  def change
    add_column :auth_ordersts, :user_todo, :text
  end
end
