class RemoveColumnsFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user_id, :bigint
    remove_column :tasks, :days_id, :bigint
  end
end
