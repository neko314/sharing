class AddNullConstraintToAssignments < ActiveRecord::Migration[5.2]
  def change
    change_column_null :assignments, :task_id, false
  end
end
