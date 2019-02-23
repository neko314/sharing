class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email, :string
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
  end
end
