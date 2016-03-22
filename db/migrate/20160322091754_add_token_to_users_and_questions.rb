class AddTokenToUsersAndQuestions < ActiveRecord::Migration
  def change
    add_column :users, :id_token, :string, unique: true
    add_index :users, :id_token, :unique => true

    add_column :questions, :id_token, :string, unique: true
    add_index :questions, :id_token, :unique => true
  end
end
