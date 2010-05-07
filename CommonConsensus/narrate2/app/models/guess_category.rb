require 'linguistics'


#gyess categories class
class GuessCategory	
  
  @@lag = 0.0
	def initialize(guess,uid,catid)
		@parsedstring = parse(guess)
        @string = guess
		@allstrings = []
		@allstrings.push(@parsedstring)
		@count = 1
		@users = []
		@catid = catid
 		@users.push(uid)

	end
	attr_reader :string, :count, :users, :allstrings, :catid
	
	def add(uid,string)
		if not @users.include?(uid)
			@count+=1 	
			@users.push(uid)
		end
	  if not string == ""
		  @allstrings.push(string)
	  end
  end

        #lte function for sort
        def <=>(gc)
           @count <=> gc.count
        end

        def similarity(a)
            puts "SIMILARITY CALLED"
           return 0
	    if @count > 3
              if contains?(a) #,@string)
                return 1.0
	      else
		return 0.0
              end
	      else
               begin
                 server = XMLRPC::Client.new("localhost","/RPC2",8080)
                 result = server.call("Similar",a,@string)
                 return result
               rescue XMLRPC::FaultException => e
                 puts "Error: "
                 puts e.faultCode
                 puts e.faultString
                 return 0
               end 
            end
            return 0
        end
         
	def contains?(a)
		for st in @allstrings
	       print "Comparing #{st} with #{a}"
	       if st.downcase == a.downcase
	   	       return true
	   	       break
	       end
		 end
	     return false
	end		
end
