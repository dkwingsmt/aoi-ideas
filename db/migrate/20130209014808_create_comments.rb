class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.integer :entry_id, :null => false
      t.text :body, :default => ""
      t.string :disabled, :null => false

      t.timestamps
    end
  end
end
