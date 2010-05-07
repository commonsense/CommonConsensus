class GoalsController < ApplicationController

  layout "goals"
  live_tree :goal_tree, :order => "order_num asc", :model => :goal
       
  before_filter :login_required, :except => [:about, :index]

  # check out a goal, one goal per def user!
  def get_goal

    ingoal = Goal.find(:first, :order => ' RAND(),goal_used asc',
		 :conditions => ["is_leaf < '1'"])
    ingoal.co
    
    if not ingoal
       flash[:notice] = "There has been an error.  Please reload"
    end
    
    
    if session[:goal]
       id = session[:goal]
       #outgoal = Goal.find(id)
       session[:goal] = nil
    end
    session[:goal] = ingoal.id
  end 
  
  def stats
  	startgoal = @params[:start] || 1
	@goals = Goal.find(:all, :offset => startgoal, :limit => 25 )
  end
  
  def parent_stats
  	@guesses = Guess.find(:all, :order => "g_type, g_string", :conditions => "game_type = 0")
  end
  
  def child_stats
  	@guesses = Guess.find(:all, :order => "g_type, g_string", :conditions => "game_type = 1")
  end
  
  
  def env_stats
  	@guesses = Guess.find(:all, :order => "g_type, g_string", :conditions => "game_type = 2")
  end
  def obstacle_stats
  	@guesses = Guess.find(:all, :order => "g_type, g_string", :conditions => "game_type = 3")
  end
  

  def info
  	if not @params[:id]
  		flash[:notice] = "You are missing a goal Id."
  		redirect_to :action => "index"
  	else
  		@goal = Goal.find(@params[:id])
  		
  	#	@g_info = Guess.find_by_sql(
  	#		"select * from guess where game_type = 1 and game_id = 2) ")
  		@g_parent = Guess.find(:all, :order => "g_type, g_string", :conditions => ["game_type = 0 and goal_id = ?", @params[:id]])
  		@g_child = Guess.find(:all, :order => "g_type, g_string", :conditions => ["game_type = 1 and goal_id = ?", @params[:id]])
  		@g_env = Guess.find(:all, :order => "g_type, g_string", :conditions => ["game_type = 2 and goal_id = ?", @params[:id]])
  		@g_obstacle = Guess.find(:all, :order => "g_type, g_string", :conditions => ["game_type = 3 and goal_id = ?", @params[:id]])
  	end
  end


  def delete_subgoal
    replace = []
    for s in session[:subgoals]
       if not s==@params[:id]
          replace.push(s)
       end
    end
    session[:subgoals] = replace
    redirect_to :action => 'splitgoal'
  end
    

  def move_up
    replace = []
    found = 0
    temp = ""
    session[:subgoals].reverse!
    for s in session[:subgoals]
       if s==@params[:id] and found==0
         found=1
       elsif found==1
         found=0
         replace.push(s)
         replace.push(@params[:id])
       else
         replace.push(s)
       end
    end
    if found==1
      replace.push(@params[:id])
    end
    replace.reverse!
    session[:subgoals] = replace
    redirect_to :action => 'splitgoal'
  end
  
  def move_down
    replace = []
    found = 0
    temp = ""
    for s in session[:subgoals]
       if s==@params[:id] and found==0
         found=1
       elsif found==1
         found=0
         replace.push(s)
         replace.push(@params[:id])
       else
         replace.push(s)
       end
    end
    if found==1
      replace.push(@params[:id])
    end
    session[:subgoals] = replace
    redirect_to :action => 'splitgoal'
  end


  def index
 
     @users = User.top_users
  end


  def add_item  
      unless session[:subgoals]
        session[:subgoals] = []
      end
      gp = @params[:goal]
      name = gp['name']
      if not (name == "" or session[:subgoals].include?(name)) 
        session[:subgoals].push(name)
      end

      redirect_to :action => 'splitgoal'
   end

   def save_items
     if request.get?
        redirect_to :action => 'splitgoal'
     end
       gp = @params[:goal]
       id =  gp['parent_id']
       goal = Goal.find(:first, :conditions => ["id = ? ", session[:goal]])
       it = 0
       session[:subgoals].each do |s|
         if not goal.children.find(:first, :conditions => ["name = ?", s])
           goal.children.create(:name =>s, :parent_id => id, :order_num => it, :added_by => session[:user])
           it+=1
         end
         
       end      
       get_goal
       
       session[:subgoals] = []
      redirect_to :action => 'splitgoal'
    end
  
    def identify_action
      if request.get?
         redirect_to :action => 'splitgoal'
      end
        gp = @params[:goal]
        id =  gp['parent_id']
        goal = Goal.find(:first, :conditions => ["id = ? ", session[:goal]])
      
        goal.is_leaf += 1
	goal.save
      
        session[:subgoals] = []
        get_goal
       redirect_to :action => 'splitgoal'
     end

  
  
  
  # the pages 
  
  def parse
    if request.get?
      
    else
      text = @params[:toparse][:toparse]
      @output = parse_goal(text)
    end
  end
  
  
  def splitgoal

    unless session[:goal] 
      get_goal
    end
    @top = Goal.find(session[:goal])
    
    unless session[:subgoals]
      session[:subgoals] = []
    end
    @children = session[:subgoals]
    @root = @top
  end
  
  def narrate_process
    if not request.get?
       get_goal
    
    
    end
    redirect_to :action => 'narrate'
  end
  
  
  def narrate
    unless session[:goal]
      get_goal
    end
    @top = Goal.find(session[:goal])
    max = ActiveRecord::Base.connection.select_one('select max(stype) from structures')['max(stype)'].to_i
    @structures = Structure.find(:all, :conditions => ["stype = ?", rand(max+1)])
  end
  
  def about
  
  end

  def auto_complete_for_object_object
    
    @top = Goal.find(session[:goal])
    @locations = Concept.find(:all, :conditions  => ["node_b = ? and relation = ? and node_a LIKE ?", "#{@top.name}", "MotivationOf", params[:object][:object] + '%'], :limit => 15, :order => "node_a desc")

    render :partial => 'locations'
  end
  
  
  def auto_complete_for_action_action
    @top = Goal.find(session[:goal])
    @locations = Concept.find(:all, :conditions  => ["node_b = ? and relation LIKE ? ", "#{@top.name}", '%' + 'event' + '%'], :limit => 15, :order => "node_a desc")
    render :partial => 'locations'
  end
  
  
  
  def auto_complete_for_place_place
    if params[:place][:place]
       terms = params[:place][:place]
    else
       terms = "a"
    end
    @top = Goal.find(session[:goal])
    #@locations = Concept.find(:all, :conditions  => ["node_b = ? and relation = ?", "#{@top.name}", "LocationOf"], :limit => 15, :order => "node_a desc")
       @locations = Concept.search( @top.name.split.collect{ |c| "%#{c.downcase}%" }, terms )
    render :partial => 'locations'
  end


  


end
