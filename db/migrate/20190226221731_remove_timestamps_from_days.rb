class RemoveTimestampsFromDays < ActiveRecord::Migration[5.2]
  def change
    remove_column :days, :created_at
    remove_column :days, :updated_at
  end
end
