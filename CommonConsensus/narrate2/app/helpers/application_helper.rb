# Methods added to this helper will be available to all templates in the application.
#require 'linguistics'
#Linguistics::use( :en )


module ApplicationHelper
  include Localization
  include CSSGraphs  
  
  
  
	if !Linguistics::EN.has_wordnet?
		puts "Lingistics module not working"
	end
	
	
	def present_part(word)
		word.en.present_participle
 	end 
 	
	
	def infinitive(word)
		word.en.infinitive
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
	  a
	end
	
	def callme(aaa)
		print "#{aaa}!!!!!!"
	end
	
	def safesim(word)
	  puts "#{word} CALLED!"
	  
	  begin
	    sim(word)
	  rescue
	    puts "\"#{word}\" not found"
	    []
	  end
	end       
	
	
  def parse(s)
  
    s = s.downcase
    s.gsub!(/(ca|do|does)n\'t /, "not ")
    s.gsub!(/(ca|do|does)n\'t$/, "not")
    s.gsub!(/t\'s\s/, "t is ")
    s.gsub!(/\'ll\s/, " will ")
    s.gsub!(/\'re\s/, " are ")
    s.gsub!(/\'ve\s/, " have ")
    s.gsub!(/\'m /, " am ")
    s.gsub!(/^im /, "i am ")
    s.gsub!(/ im /, " i am ")
    s.gsub!(/^so /, "")
    s.gsub!(/(you|they|we|one|he|she|i) (could|can)/, '\1')
    f = "(a|an|the)"
  

  case s
    when /^(because|cause)\s(\w+)\s(is)\s(.+)/;
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
  #  when /^so\syou\s(are|become|will\sbe|)\s(\w+)$/;
	#    return "DESIRE: be => #{$2}"
  #  when /^so\syour\s(\w+)\snot\s(.+)/;
	#    return "DESIRE NOT: #{$1} => #{$2}"    
     when /^you\s(are|become|will\sbe|)\s(\w+)$/;
	    return "DESIRE: be => #{$2}"
     when /^you\s(\w+)\snot\s(.+)/;
	    return "DESIRE NOT: #{$1} => #{$2}"
     when /^(for|i am trying to|in\sorder\sto)((a|an|the)\s|)\s(.+)/;
	    return "WANT: #{$4}"
#     when /^so you (\w+) it (\w+)|(and$)|^\w+$/;
	#    return "ATTN: #{s}"
     when /^you (\w+) it (\w+)|(and$)|^\w+$/;
	    return "ATTN: #{s}"
     when /^(have|want|desire|need|require)\s(.+)/;
        case ($2)
	          when /^(\w+)$/;
              return "need => #{$1}"
            when /^(a|an|some|the)\s(.+)$/;
 	            return "desire => #{$2}"
	          when /^(to)\s(\w+)\s(a|an)\s(.+)$/;
              return "ACT: #{$2} => #{$4}"
	          end
	  when /^(to)\s(\w+)\s(a|an)\s(\w+)$/;
       return "INF_ACT_OBJ: #{$2} => #{$3} #{$4}"
    when /^to\s(\w+) (your|ones|my|his|her|their) (.+)/
       return "INF_ACT_OBJ: #{$1} => #{$3}"
    when /^(because|cause |)(\w+)\s(want|wants)\s(to) (\w+) (.+)$/
      return "ACT: #{$5} => #{$6}"
#    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)$/;
 #       return "INF_ACT: to => #{$3}"
#    when /^so (you|i|they|one|it) (will |)(\w+s|\w+)( not|) (.+)/;
 #     return "ACT: #{$3}#{$4} => #{$5}" 
    when /^(you|i|they|one|it) (will |)(\w+s|\w+)$/;
        return "INF_ACT: to => #{$3}"
    when /^(you|i|they|one|it) (will |)(\w+s|\w+)( not|) (.+)/;
      return "ACT: #{$3}#{$4} => #{$5}" 
    when /^to get to (.+)/
      return "INF_ACT: arrive => #{$1}"
    when /^(to)\s(\w+)\s(.+)$/;
       return "INF_ACT: #{$2} => #{$3}"
    when /(.+)(it)(.+)ing$/;
         return "CON: #{s}"
    when /^\w+ of \w+$/;
        return "CON: #{s}"
    when /(^too | too )/;
            return "CON: #{s}"
    when /(you|i|they|one) (are|have|am|is) (.+)/;
       return "CON: #{$3}"\
    when /because|cause (if|the) (.+)/
       return "CON: #{$1} #{$2}"
    when /(\w+) (is) (.+)/
        return "CON: #{$1} is #{$3}"
    when /makes you/;
       return "CON: #{s}"
    when /^it is (.+)$/
        return "CON: #{s}"
    when /^(to)\s(\w+)$/;
        return "INF_ACT: #{$1} => #{$2}"
   when /^(be)\s(\w+)$/;
        return "INF_ACT: #{$1} => #{$2}"
   when /^(((because|cause)\s|)(.+\sto$))|(.+is\sobvious.+)|(i not)$/
        return "SELF_REF: #{s}"
    when /^(you)\s(\w+) (.+)$/;
        return "ACT: #{$2} => #{$3}"

#    when /^(\w+)\s(\w+)$/;
#        return "ACT: #{$1} => #{$2}"

    
    else;
        return s
    
    end
    
  end


end

          
