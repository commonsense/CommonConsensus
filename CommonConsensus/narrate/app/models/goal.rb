class Goal < ActiveRecord::Base
 
  acts_as_tree :order => "id", :counter_cache => true

  attr_accessible :name, :display_children

  def co
    self.goal_used += 1
    self.save
  end

  
  def self.display_children(parent)
    children = []
    parent.children.each {|child| children.push(child) }
    return children
  end
  


  
  
end
