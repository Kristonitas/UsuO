class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :question_id
      t.integer :response_id
      t.integer :user_id
      t.text :content

      t.string :id_token, unique: true


      t.timestamps null: false
    end

    add_index :responses, :id_token, :unique => true
  end
end
