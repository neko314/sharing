class AddDayIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :day, foreign_key: true, null: false
  end
end
