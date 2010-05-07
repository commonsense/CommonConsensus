require 'thread'
load 'parse.rb'


# game state class
class GameState
	def initialize(pag, dur, meth = lambda {})
		@page = pag
		@duration = dur
		@trigger = meth
	end

	attr_reader :page, :duration, :block
#	attr_accessor :next
end

class Game
	def initialize (states_array)
		@mutex = Mutex.new
		@states = states_array
		resetGame
		# additional functions
		@guesses = []
		@players = []
		setParameters
	end
	
	attr_reader :goal, :gametype, :answers, :quote, :players, :guesses
	
	def currentState()
		@states[@current_state_index]
	end
	
	def nextState()
		@current_state_index += 1
		
		if @current_state_index == @states.length
			@current_state_index = 0
		end
		#currentState.trigger.call
		if currentState.page == "display_question"
			# clear guesses, set parameters, clear players
			# order is important!
			if @guesses 
				@guesses.clear
				@guesses = []
			else
				@guesses = []
			end
			setParameters  
			if @players 
				@players.clear
			else
				@players = []
			end
		elsif currentState.page == "display_answers"
			@answers = gradeAnswers(@guesses)
		end
		return currentState
	end
	
	def nextEdgeTime()
		@next_edge_time
	end
	
	def addPlayer(id)
		if not @players.include?(id)
			@players.push(id)
		end
	end
	
	def resetGame
		#setParameters
		@current_state_index = 0
		@next_edge_time = Time.at(Time.now.to_f + currentState.duration)
	end
	#alias_method :startGame, :resetGame
	
	def checkEdge
		@mutex.synchronize do
			if Time.now >= @next_edge_time
				nextState
				@next_edge_time = Time.at(Time.now.to_f + currentState.duration)
				#currentState.func.call
			end
		end			
	end	
	
	
		## GAME FUNCTIONS ##
	def setParameters
	   $up_weight = 0 if not $up_weight
	   if false #ENV['RAILS_ENV'] == 'development'
	     @goal = find(:first, :order => "goal_used asc, rand()", :conditions => ["id = 140"])
	   else
	     @goal = find(:first, :order => "goal_used asc, rand()", :conditions => ["is_leaf < '3'"])
	   end
	   @goal.goal_used += 1
	   @goal.save!
	   goalcount = find_by_sql("select count(*) as gc from goals")
	   gc = goalcount[0].gc
	   sparsity = find_by_sql("(select count(*) as sp from guesses where game_type = 0 and goal_id ="+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 1 and goal_id = "+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 2 and goal_id ="+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 3 and goal_id = "+@goal.id.to_s+")")
	   averages = find_by_sql("(select count(*)/"+gc.to_s+" as av from guesses where game_type = 0) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 1) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 2) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 3)")
	
	   
       if ENV['RAILS_ENV'] == 'production'  # just for AAAI demo
	      @gametype = rand(4)
	   elsif sparsity[0].sp.to_i <= averages[0].av.to_i + $up_weight
	      @gametype = 1
	   elsif sparsity[1].sp.to_i <= averages[1].av.to_i + $up_weight
	      @gametype = 1
	   elsif sparsity[2].sp.to_i <= averages[2].av.to_i + $up_weight
	      @gametype = 2
	   else
	   	  @gametype = 3
	      $up_weight += 0.1
	   end        
	   
	   # add stock answers with 3 players or fewer
	   if @players.size() <= 3
	     
	      stockanswers = Guess.find(:all, :conditions => ["game_type = ? and goal_id = ?", @gametype, @goal.id], :order => "category")
	  	  lastcat = 0
	  	  current = nil
	  	  for sa in stockanswers
             if sa.category != lastcat
                if lastcat != 0
                   @guesses.push(current)
	            end
                lastcat = sa.category
                current = GuessCategory.new(sa.g_string,44,lastcat)
             else
                current.add(44,sa.g_string)
             end
          end
          @guesses.push(current) if current != nil
	   
	   end # end add stock players
	end
	
	
	def addGuess(in_g,uid)	
		# QUESTION:  what happens when two users add at the same time,
		# does it return the wrong id/pos?
	 	
	 	gamecat = -1
        parsedguess = parse(in_g)
	  	found = false
        # first look for identicial matches
	  	@guesses.each do |g|
	  	   if g.contains?(parsedguess)
	  	  	  g.add(uid,"")
	  	  	  gamecat = g.catid
	  	  	  found = true
	  	  	  puts "FOUND IN CATEGORY #{gamecat}"
	  	  	  break
	  	   end
        end 
                      
        # then use gluenet
        if not found
           @guesses.each do |g|
              similarity = g.similarity(in_g)
              if similarity >= 0.75
                  g.add(uid,in_g)
                  gamecat = g.catid
                  found = true
                  break
                  puts "FOUND IN GLUENET #{gamecat}"
              end
	  	   end
        end
	  	if not found
	  	   gamecat = @guesses.size()+1
	  	   temp = GuessCategory.new(in_g,uid,gamecat)
	  	   @guesses.push(temp)
	  	   puts "CREATED NEW CATEGORY #{gamecat}"
	   	end
	   	# add guess to db
	    g = add_guess_to_db(in_g,@goal.id,gamecat,1,@gametype)
	    return gamecat
	end

def gradeAnswers(contents)
	
	if not @guesses or @guesses.size() == 0
	 	return []
	end
	
	

            @guesses.sort!.reverse!
                pos = 0
                t = []
                last = @guesses[0].count
                for gs in @guesses
                        thash = Hash.new
                        thash['question'] = gs.string
                        thash['count'] = gs.count
                        thash['strings'] = gs.allstrings
                        thash['users'] = gs.users
                        if thash['count'] != 1 #and pos < 3
                            thash['score'] = thash['count']*2
                            # score users
                                for x in thash['users']
                                        user = User.find(x)
                                        user.score+=thash['score']
                                        user.save!
                                end
                        else
                                thash['score'] = 0
                        end

                        pos += 1
                        t.push(thash)
                end
                return t
        end
end

 #############
 ## ADD GUESS TO DB
 ##############
 

 def add_guess_to_db(in_g, goal, categ, times_chosen=1, game_type=1)
 	ruletypes = {"ACT"=> 1, "CON"=> 2, "WANT" => 3, "ACT" => 4, "DESIRE" => 5, "INF_ACT_OBJ" => 6, "INF_ACT" => 7, "SELF_REF" => 10, "ATTN" =>11, "UNK" => 12}  
    g = parse(in_g)
    if g =~ /(.+): (.+) => ((for|on|good|more|less|nice|\w+ful|the|a|an|about|some|your|ones) |)+(\w+)( .+|)/
      type = "#{$1}"
      body = "#{$2}"
      subject = "#{$5}"
      both = "#{$2} #{$5}#{$6}"
    elsif g =~ /(.+): (.+)/
      type = "#{$1}"
      body = "#{$2}"
      subject = ""
      both = "#{$2}"     
    elsif g =~ /(\w+) (.+)/
      type = "UNK"
      body = "#{$1}"
      subject = "#{$2}"
      both = "#{$1} #{$2}"    
    else
      type = "UNK"
      body = ""
      subject = ""
      both = g
    end

  x = Guess.find(:first, :conditions => ["g_both = ? and  game_type = ? and goal_id = ?", both, game_type, goal])
  if not x
  	Guess.create(:g_string => in_g, :game_type => game_type, :g_type => 
  	ruletypes[type], :num => times_chosen, 
  		:g_verb => body, :g_noun => subject, :g_both => both, :goal_id => goal, :category => categ)
  else 
    x.num += 1
    x.save!
  end
  
    out_str = ""
    both.gsub(/=>/,"").split.each do |x|
    	out_str += " #{x}"
    end
    puts "Out String: #{out_str}"
    return out_str.strip
end
  
  
  
  