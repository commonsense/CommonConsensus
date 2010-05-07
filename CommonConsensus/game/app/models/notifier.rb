class Notifier < ActionMailer::Base
  
  attr_accessor :test 

  
  def resend_password( user )
    puts "Password emailed to #{user.email}"
    @recipients = "#{user.email}"
    @from = "<a href='mailto:narrate@media.mit.edu/'>narrate@media.mit.edu</a>" 
    @subject = "Narrate Game Lost Password" 
    @body["user"] = user
  end
  
  
end
