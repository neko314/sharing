class AddGroupToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :group, foreign_key: true, null: false
  end
end
