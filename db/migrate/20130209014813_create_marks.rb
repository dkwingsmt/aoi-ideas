class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :user_id, :null => false
      t.integer :entry_id, :null => false
      t.integer :score, :null => false
    end
    add_index :marks, [:entry_id, :user_id], :unique => true
  end
end
