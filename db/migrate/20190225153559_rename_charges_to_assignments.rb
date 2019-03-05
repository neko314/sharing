class RenameChargesToAssignments < ActiveRecord::Migration[5.2]
  def change
    rename_table :charges, :assignments
  end
end
