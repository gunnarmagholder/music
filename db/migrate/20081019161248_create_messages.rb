class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :text
      t.integer :sent_user
      t.integer :recv_user
      t.boolean :read
      
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
