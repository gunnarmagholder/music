class Title < ActiveRecord::Base

  has_many :pieces
  
  def occurences
    Pieces.find_by_title_id(self.id).size
  end
  
end
