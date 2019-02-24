class AddNullFalseToTabels < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false
    change_column :groups, :name, :string, null: false
    change_column :groups, :user_id, :bigint, null: false
  end
end
