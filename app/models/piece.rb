class Piece < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :title, :class_name => "Title", :foreign_key => "title_id"
  belongs_to :interpret, :class_name => "Interpret", :foreign_key => "interpret_id"
  belongs_to :category, :class_name => "Category", :foreign_key => "category_id"
  
  validates_presence_of :title_id, :on => :create, :message => "can't be blank"
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :interpret_id, :on => :create, :message => "can't be blank"
  
  def interpret_name
    interpret.name if interpret
  end
  
  def interpret_name=(name)
    self.interpret = Interpret.find_or_create_by_name(name) unless name.blank?
  end
  
  def title_name
    title.name if title
  end
  
  def title_name=(name)
    self.title = Title.find_or_create_by_name(name) unless name.blank?
  end
  
  def category_name
    category.name if category
  end
  
  def category_name=(name)
    self.category = Category.find_or_create_by_name(name) unless name.blank?
  end
  
end
