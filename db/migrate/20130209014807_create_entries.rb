class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id, :null => false
      t.string :title, :default => ""
      t.text :abstract, :default => ""
      t.text :body, :default => ""
      t.integer :category, :null => false
      t.boolean :published, :null => false
      t.boolean :disabled, :null => false, :default => false

      t.timestamps
    end
  end
end
