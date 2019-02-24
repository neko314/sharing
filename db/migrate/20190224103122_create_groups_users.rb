class CreateGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :groups, :users do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
