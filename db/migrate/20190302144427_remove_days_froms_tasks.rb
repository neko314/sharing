class RemoveDaysFromsTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :day, foreign_key: true, null: false
  end
end
