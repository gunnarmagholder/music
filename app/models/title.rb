class Title < ActiveRecord::Base

  has_many :pieces
  
  def occurences
    pieces = Piece.find(:all, :conditions => ['title_id = ?' , self.id])
    if pieces.class == Array
      pieces.size
    else
      1
    end
  end
  
end
