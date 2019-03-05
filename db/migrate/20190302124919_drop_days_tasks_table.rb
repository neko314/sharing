class DropDaysTasksTable < ActiveRecord::Migration[5.2]
  drop_join_table :days, :tasks do |t|
      t.index :day_id
      t.index :task_id
  end
end
