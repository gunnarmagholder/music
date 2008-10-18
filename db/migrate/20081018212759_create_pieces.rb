class CreatePieces < ActiveRecord::Migration
  def self.up
    create_table :pieces do |t|
      t.string :notes
      t.references :user
      t.references :category
      t.references :interpret
      t.references :title
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pieces
  end
end
