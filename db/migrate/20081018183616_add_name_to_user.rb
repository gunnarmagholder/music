class AddNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :lastname, :string
  end

  def self.down
    remove_column :users, :lastname
    remove_column :users, :name
  end
end
