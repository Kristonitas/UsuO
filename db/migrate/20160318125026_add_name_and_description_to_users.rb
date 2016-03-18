class AddNameAndDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, nil: false, default: "Default Name"
    add_column :users, :description, :text
  end
end
