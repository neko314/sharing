class AddNullConstraintToDays < ActiveRecord::Migration[5.2]
  def change
    change_column_null :days, :name, false
  end
end
