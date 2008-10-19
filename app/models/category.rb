class Category < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :pieces
  
  def occurences
    pieces = Piece.find(:all, :conditions => ['category_id = ?' , self.id])
    if pieces.class == Array
      pieces.size
    else
      1
    end
  end
end