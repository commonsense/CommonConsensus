require File.dirname(__FILE__) + '/config/environment'

state = 0
x = Control.find(1)
x.state =3 
x.save!
 
loop do
    if state == 0
       t = 7
    elsif state == 1
       t = 50
    elsif state == 2
       t = 7
    elsif state == 3
       t = 26 
    end
    x.advance(t)
    sleep(t)
    if state != 3
      state +=1
    else
      state= 0
   end
end

