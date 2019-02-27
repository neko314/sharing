class AddTimestampsToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :created_at, :datetime, null: false
    add_column :assignments, :updated_at, :datetime, null: false
  end
end
