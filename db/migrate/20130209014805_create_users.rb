class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :hashed_password, :null => false
      t.string :name, :null => false
      t.timestamp :lastlogin, :null => false
      t.boolean :gender, :null => false     # true for male, false for female
      t.string :locale, :default => "UTF-8"
      t.string :avatar
      t.boolean :disabled, :null => false
      t.boolean :admin, :null => false

      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
