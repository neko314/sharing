class RemoveDaysFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :day, null: false
  end
end
