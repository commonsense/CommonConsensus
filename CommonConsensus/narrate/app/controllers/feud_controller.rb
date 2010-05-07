class FeudController < ApplicationController
   include ActionView::Helpers::TextHelper
  require 'user_system'
  model :user
  model :control
  model :goal


 before_filter :login_required

#  To do:
#  - Multiple Games
#  - Better parsing of answers

def dynamic_score
	if request.xhr?
	   @guesses = $currentGame.guesses
	   render(:partial => "dynamic_score")
	else
		render(:text => "Nothing here.")
	end
end

def add_item
	@guess = sanitize(strip_tags(params[:newguess][:name].strip.downcase)) || ''
 	# add the current player
 	#if @session[:f_guess].size == 0
 	#	$currentGame.addPlayer(session[:user].id)
 	#end

    # see if the guess is unique
	unique = 1
    @session[:f_guess].each do |x| 
      if x[:string] == @guess
         unique = 0
      end
    end
    if $currentGame.currentState.page == "display_question"
    
    
        if not (@guess =='' or unique==0)
        	 id = $currentGame.addGuess(@guess,session[:user].id)
        	 @session[:f_guess].push({:string => @guess, :id => id})
        	 render(:partial => "dynamic_score")

    	else
    		render(:partial => "dynamic_score")
    	end
	else
		render(:text => "Buzz! Time's up.")
	end
end

def index
	redirect_to :controller => "goals", :action => "index"
end


def game1
  if @request.env['HTTP_USER_AGENT'] =~ /msie/i
     @headers['Pragma'] = ''
     @headers['Cache-Control'] = ''
  else
     @headers['Pragma'] = 'no-cache'
    @headers['Cache-Control'] = 'no-cache, must-revalidate'
  end
	if params[:bad_goal_id]
	
		g = Goal.find(params[:bad_goal_id])
		
	
		b = Bad.find(:first, :conditions => ["goal_id = ? and game_type = ?", params[:bad_goal_id], params[:game_type]])
		if b
			b.times += 1
			if b.times >= 1
			    g.goal_used+=10
		            g.save!
			end
			b.save!
		else
			Bad.create(:goal_id => params[:bad_goal_id], :game_type => params[:game_type])
		end
		flash[:notice] = "Thanks for letting us know that this is a rotten question."
	else
		 @session[:f_guess] = []
    end

      
	$currentGame.checkEdge()
	$currentGame.addPlayer(session[:user].id)
	@goal = $currentGame.goal
	@gametype = $currentGame.gametype
	@next = ($currentGame.nextEdgeTime - Time.new).floor
	@answers = $currentGame.answers
	@players = $currentGame.players
	
	if $currentGame.currentState.page == "display_question" and session[:user].role == nil and session[:user].score > 10 and rand(5) == 1
	   	@page_title= "Feedback Page"
	   	render :action => "give_feedback" and return false
	end
	
	render :action => $currentGame.currentState.page and return false
end 

##################################
######## User Feedback  ##########
##################################

def give_feedback
	@page_title= "Feedback Page"
	
end


def submit_feedback
	me = User.find(session[:user].id)
	me.role = 1
	me.save!
	session[:user].role = 1
	if @params[:commit] != "No Thanks!"
	
	   @quest = @params[:questions]
	   Feedback.create(:first => @quest[:first], :second => @quest[:second], :third => @quest[:third], :fourth => @quest[:fourth], :fifth => @quest[:fifth], :userid => @session[:user].id)
	   flash[:notice] = "Thank you for your feedback!"
	end
	redirect_to :action => "game1"
    
end


# one of the most beautiful lines of SQL ever written, keep it around.
#  @guesses = TempGuesses.find_by_sql("select ag.*, count(ag.id)+(ag.num-1) as numc 
 #     from ((select * from temp_guesses) union 
 #     (select * from guesses where goal_id = "+@goal.id.to_s+" and game_type = "+$gametype.to_s+")) ag group by ag.g_both order by numc desc, ag.g_both")
   
  
  # print out all of the answers
  # debugging page.
  def answer
    @ctrl = Control.find(1)
    @ctrl.add_player(session[:user].id)
    #@ctrl.reparse
    @session[:f_guess] = @session[:f_guess] || []
    state = @ctrl.state   
    @goal = Goal.find(@ctrl.goal)
    @next =  10000
    @guesses = TempGuesses.find_by_sql("select ag.*, count(ag.id) as numc from ((select temp_guesses.*
	  from temp_guesses) union (select guesses.* from guesses)) group by ag.g_both order by numc desc, ag.g_both")
        
    @players = TempUsers.find(:all)
    render :action => "display_answers"
  end 
  
  
 
end

