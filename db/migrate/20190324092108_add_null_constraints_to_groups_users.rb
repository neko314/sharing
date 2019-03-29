class AddNullConstraintsToGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :groups_users, :group_id, false
    change_column_null :groups_users, :user_id, false
  end
end
