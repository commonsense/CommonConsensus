# include dependencies
#require 'localization'
require_dependency "login_system"
#require "live_tree/live_tree.rb"  
#require 'linguistics'
#Linguistics::use( :en )
require "app/models/game.rb"
class ApplicationController < ActionController::Base
  
  include LoginSystem
#  include Localization
  #include LiveTree
 # helper LiveTreeHelper  

#  helper :sparklines


	## GAME FUNCTIONS ##
	def setParameters
	   @up_weight = 0 if not @up_weight
	   @goal = Goal::find(:first, :order => "goal_used asc, RAND()", :conditions => ["is_leaf < '1'"])
	   @goal.goal_used += 1
	   @goal.save!
	   goalcount = Goal::find_by_sql("select count(*) as gc from goals")
	   gc = goalcount[0].gc
	   sparsity = Guess::find_by_sql("(select count(*) as sp from guesses where game_type = 1 and goal_id ="+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 2 and goal_id = "+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 3 and goal_id ="+@goal.id.to_s+") union (select count(*) as sp from guesses where game_type = 4 and goal_id = "+@goal.id.to_s+")")
	   averages = Guess::find_by_sql("(select count(*)/"+gc.to_s+" as av from guesses where game_type = 1) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 2) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 3) union (select count(*)/"+gc.to_s+" as av from guesses where game_type = 4)")
		@quote = Quote.find(:first, :order => "RAND()" )
	   if sparsity[0].sp <= averages[0].av #+@up_weight
	      @gametype = 0
	   elsif sparsity[1].sp <= averages[1].av #+@up_weight
	      @gametype = 1
	   elsif sparsity[2].sp <= averages[2].av #+@up_weight
	      @gametype = 2
	   else
	   	  @gametype = 3
	      @up_weight += 0.1
	   end        
	end

setParams = nil
  #intitalization of globals
  if not $initialized
	 state_array = [GameState.new("display_question", 35, setParams), GameState.new("display_answers", 10)]
	 $initialized = true
	 $players  = []
	 $currentGame = Game.new(state_array)
	 puts $currentGame.inspect
  end



	def simhelper (word, type)
	  word.en.send(type).collect{|synset| synset.words}
	end
	
	def sim (word)
	  a =  simhelper(word, "hyponyms")
	  a += simhelper(word, "hypernyms")
	  a += word.en.synset.words
	  a = a.flatten
	  a += a.collect{|w| w.en.plural}
	  a.uniq
	  a.sort
	  return a
	end
	
	def safesim(word)
	  begin
	    sim(word)
	  rescue
	    puts "\"#{word}\" not found"
	    []
	  end
	end

 


     def get_and_go(sex)
        first = Control.find(1)
	first.advance(sex)
 	first.save!
     end
  def parse_goal(text)
    text.gsub(/"/,'')
    #cmd = "echo  '#{text}'| /Users/dustin/narrate/vendor/pos/cmd/tag" 
    cm1 = 'echo "'
    cm2 = '" | /Users/dustin/narrate/vendor/pos/cmd/tag'
     print 
     # 2. Execute the command
     rsp = %x{#{cm1}#{text}#{cm2}}

     rsp.gsub(/(\w+)\s(\w+|[?!.])/, '\2/<font color=blue>\1</font> ')
  end
 
 
 


end

