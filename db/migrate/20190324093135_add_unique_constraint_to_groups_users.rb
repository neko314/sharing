class AddUniqueConstraintToGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id, unique: true
  end
end
