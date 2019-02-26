class RemoveDaysFromAssignment < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :days_id
  end
end
