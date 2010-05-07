module GoalsHelper
  
  




  
  def add_ite2
      gp = @params[:goal]
      id =  gp['parent_id']
      name = gp['name']
      goal = Goal.find(:first, :conditions => ["id = ? ", id])
      
      if goal.children.find(:first, :conditions => ["name = ?", name])
        flash[:notice] = "#{name} already exists as a sub-goal"
      else
         goal.children.create(:name =>name, :parent_id => id)
      end
      
      @top = goal
       
      @children = Goal::display_children(goal)
      render :action => 'splitgoal'
   end

  

     
end
