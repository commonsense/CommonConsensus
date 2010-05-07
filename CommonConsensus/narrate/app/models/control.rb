class Control < ActiveRecord::Base
	
  $up_weight = 0
  belongs_to :feud
  attr_accessible :last, :remaining, :state, :players

  @@ruletypes = {"ACT"=> 1, "CON"=> 2, "WANT" => 3, "ACT" => 4, "DESIRE" => 5, "INF_ACT_OBJ" => 6, "INF_ACT" => 7, "SELF_REF" => 10, "ATTN" =>11, "UNK" => 12}  
 
 #############
 ## ADVANCE -- called by separate thread
 ##############
 

 def add_guess(in_g, goal, times_chosen=1, game_type=1)

	
	
    g = parse(in_g)
    if g =~ /(.+): (.+) => ((for|on|good|more|less|nice|\w+ful|the|a|an|about|some|your|ones) |)+(\w+)( .+|)/
      type = "#{$1}"
      body = "#{$2}"
      subject = "#{$5}"
      both = "#{$2} => #{$5}#{$6}"
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

  x = Guesses.find(:first, :conditions => ["g_string = ? and  game_type = ? and goal_id = ?", in_g, game_type, goal])
  if not x
  	Guess.create(:g_string => in_g, :game_type => game_type, :g_type => @@ruletypes[type], :num => times_chosen, 
  		:g_verb => body, :g_noun => subject, :g_both => both, :goal_id => goal)
  else 
    x.num += times_chosen
  end
  
    out_str = ""
    both.gsub(/=>/,"").split.each do |x|
    	out_str += " #{x}"
    end
    puts "Out String: #{out_str}"
    return out_str.strip
    
  end
  
  

  def reparse
    @Guesses = Guess.find(:all)
    for e in @Guesses do
      g = parse(e.g_string)
      if g =~ /(.+): (.+) => ((for|on|good|more|less|nice|\w+ful|the|a|an|about|some|your|ones) |)+(\w+)( .+|)/
        type = "#{$1}"
        body = "#{$2}"
        subject = "#{$5}"
        both = "#{$2} => #{$5}#{$6}"
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
      x = Guess.find_by_g_string(e.g_string)
      if x.id == e.id
        x.destroy
        Guess.create(:g_string => e.g_string, :g_type => @@ruletypes[type], :num => e.num, :g_verb => body, :g_noun => subject, :g_both => both, :goal_id => e.goal_id)
      elsif not x
         Guess.create(:g_string => e.g_string, :g_type => @@ruletypes[type], :num => e.num, :g_verb => body, :g_noun => subject, :g_both => both, :goal_id => e.goal_id)
      else
         x.num+=1
         x.save!
      end
   end
  
end
  
  def remaining
    self.last
  end  
  
  # BAD ones
  # to go on a date =>   go  | on
  # 
   # from ?
  # BAD ADJECTIVES
  # - fresh
  # 
   def parse(s)
    # last update 12-11-05 7:06 pm , Alea
    s = s.downcase
    s.gsub!(/\!\?\.\;\,/, "")
    s.gsub!(/(ca|do|does)n\'t /, "not ")
    s.gsub!(/(ca|do|does)n\'t$/, "not")
    s.gsub!(/t\'s\s/, "t is ")
    s.gsub!(/\'ll\s/, " will ")
    s.gsub!(/\'re\s/, " are ")
    s.gsub!(/\'ve\s/, " have ")
    s.gsub!(/\'m /, " am ")
    s.gsub!(/^im /, "i am ")
    s.gsub!(/ im /, " i am ")
    s.gsub!(/^so you are/, "to be")
    s.gsub!(/^so (you |) (can |)/, "to ")
    s.gsub!(/very |a lot of |extremely |really /, "")
    s.gsub!(/(you|they|we|one|he|she|i) (could|can)/, '\1')
    f = "(a|an|the)"


  case s
    when /^(because)\s(\w+)\s(is)\s(.+)/;
      return "CON: #{$2} is #{$4}"
    when /^(because)\s(\w+)\s(are)\s(.+)/;
      return "CON: #{$2} are #{$4}"
    when /^(\w+ing)\s(.+)$/
      return "CON: #{s}"
    when /^(\w+) (not |)(like) (.+)/
      return "CON: #{$2} like #{$4}" 
    when /^(\w+) (I|you|they)(like) (.+)/
      return "CON: #{$2} like #{$4}" 
    when/^(\w+)\s(want)\s(a|an|the)\s(.+)$/
      return "WANT: #{$4}"
    when/^(so |because |)they (\w+ |)give you (.+)/
      return "ACT: get => #{$3}"
   when /^you\s(are|become|will\sbe|)\s(\w+)$/;
     return "DESIRE: be => #{$2}"
    when /^your\s(\w+)\snot\s(.+)/;
     return "DESIRE NOT: #{$1} => #{$2}"
   when /^(for|i am trying to|in\sorder\sto)((a|an|the)\s|)\s(.+)/;
     return "WANT: #{$4}"
   when /^so you (\w+) it (\w+)|(and$)|^\w+$/;
     return "ATTN: #{s}"
    when /^(have|want|desire|need|require)\s(.+)/;
        case ($2)
           when /^(\w+)$/;
              return "need => #{$1}"
            when /^(a|an|some|the)\s(.+)$/;
 	            return "desire => #{$2}"
            when /^(to)\s(\w+)\s(a|an)\s(.+)$/;
              return "ACT: #{$2} => #{$4}"
            else
              return parse("to #{s}")
           end
   when /^(to)\s(\w+)\s(a|an)\s(\w+)$/;
       return "INF_ACT_OBJ: #{$2} => #{$3} #{$4}"
    when /^to\s(\w+) (your|ones|my|his|her|their) (.+)/
       return "INF_ACT_OBJ: #{$1} => #{$3}"
    when /^(because |)(\w+)\s(want|wants)\s(to) (\w+) (.+)$/
      return "ACT: #{$5} => #{$6}"
    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)$/;
        return "INF_ACT: to => #{$3}"
    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)( not|) (.+)/;
      return "ACT: #{$3}#{$4} => #{$5}" 
    when /^to get to ((the|a|an|some|your|my|their|ones) |)(\w+)$/
      return "INF_ACT: arrive => #{$3}"
    when /^(to)\s(\w+)\s(.+)$/;
       return "INF_ACT: #{$2} => #{$3}"
    when /(.+)(it)(.+)ing$/;
         return "CON: #{s}"
    when /^\w+ of \w+$/;
        return "CON: #{s}"
    when /(^too | too )/;
            return "CON: #{s}"
    when /^(you|i|they|one) (are|have|am|is) (.+)/;
       return "CON: #{$3}"\
    when /because (if|the) (.+)/
       return "CON: #{$1} #{$2}"
    when /(\w+) (is) (.+)/
        return "CON: #{$1} is #{$3}"
    when /makes you/;
       return "CON: #{s}"
    when /^it is (.+)$|^because/
        return "CON: #{s}"
    when /^(to)\s(\w+)$/;
        return "INF_ACT: #{$1} => #{$2}"
   when /^(be)\s(\w+)$/;
        return "INF_ACT: #{$1} => #{$2}"
   when /^(((because)\s|)(.+\sto$))|(.+is\sobvious.+)|(i not)$/
        return "SELF_REF: #{s}"
   when /(.+)/
        return "ATTN: #{$1}"

    end

  end
end
