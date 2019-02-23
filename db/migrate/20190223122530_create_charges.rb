class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.references :user, foreign_key: true
      t.references :days, foreign_key: true
      t.references :tasks, foreign_key: true
    
      t.timestamps
    end
  end
end
