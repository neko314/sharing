class AddDayToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :day, foreign_key: true
  end
end
