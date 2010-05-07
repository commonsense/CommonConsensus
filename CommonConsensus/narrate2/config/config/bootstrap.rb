require 'daemonize'
include Daemonize


daemonize()

  loop do
    $last = Time.now
    if $state == 0
      $players=[]
      $feudgoal = Goal::find(:first, :order => ' RAND(),goal_used asc',
  		 :conditions => ["is_leaf < '1'"])
      $state=1
      sleep(60) #120
    elsif $state == 1
      $state=2
      sleep(10) #30      
    elsif $state == 2
      $state=0
      sleep(15) #30
    end
end
