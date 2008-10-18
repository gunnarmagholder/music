class CreateInterprets < ActiveRecord::Migration
  def self.up
    create_table :interprets do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :interprets
  end
end
