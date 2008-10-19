class Interpret < ActiveRecord::Base
  has_many :pieces
  
  def occurences
    pieces = Piece.find(:all, :conditions => ['interpret_id = ?' , self.id])
    if pieces.class == Array
      pieces.size
    else
      1
    end
  end
end
