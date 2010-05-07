
require 'linguistics'
Linguistics::use( :en )

def filterstops(inword)
	return inword.downcase.gsub(/( |^)(in|at|of|before|but|the|they|we|i|him|me|she|it|always|because|so|that|will|do|to|was|were|want|be) /, " ")
end

	
	if !Linguistics::EN.has_wordnet?
		puts "Lingistics module not working"
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
		
		
$gcs = []
class GuessCategory
		def initialize(guess,id)
			@strings = []
			@synonyms = []
			@count=0
			@users = []
			self.add(guess,id)
		end
		
		def add(gin,uid)
			g = filterstops(gin)
		 	#if self.contains?(g)
			 	@strings.push(g)
			 	g.split.each do |x|
			 		simnet = safesim(x)
			 		simnet.each do |s|
			 			@synonyms.push(s.downcase)
			 		end
			 	end
			@count+=1 	
			@users.push(uid)
			#end
		end
		
		def contains?(gin)
			g = filterstops(gin)
			#choppedstrings = []
			#@strings.each {|x| x.split.each {|t| choppedstrings.push(t) } }   
			#choppedstrings.uniq!
			if @synonyms.include?(g)
			 	return true
			end
			g.split.each do |w|
				puts "Looking at: #{w}"
				if @synonyms.include?(w) or @synonyms.include?(w.en.infinitive)# or choppedstrings.include?(w)
					return true
					puts "THIS WAS FOUND"
				end
			end
			return false
		end
		
		def to_s
			ostring = ""
		    @strings.each do |x|
		    	ostring+= "#{x}<br>"
		    	
		    end
		      @synonyms.each do |x|
		    	ostring+= "#{x}<br>"
		    	
		    end
		    
		    ostring			
		end

  
	end
	

def guess(g,uid)
	added = false
	$gcs.each do |gc|
		if gc.contains?(g)
		   added = true
		   gc.add(g,uid)
	    end
	end
    if not added
    	puts "Guess Added"
      	tguess = GuessCategory.new(g,uid)
		$gcs.push(tguess)
	else 
		puts "Guess Dupe!"
	end
	$gcs.inspect
end
	