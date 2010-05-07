require 'linguistics'


#gyess categories class
class GuessCategory	
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
            begin 
              server = XMLRPC::Client.new("localhost","/",8080)
               server.call("AddString",a)
              result = server.call("Compare",@string)
            rescue XMLRPC::FaultException => e
              puts "Error: "
              puts e.faultCode
              puts e.faultString
            end 
          return result
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
