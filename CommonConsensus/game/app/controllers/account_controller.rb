

	
class AccountController < ApplicationController
  	layout  'goals'

	  def login
	    case @request.method
	      when :post
	      if @session[:user] = User.authenticate(@params[:user_login], @params[:user_password])
	        flash['notice']  = "Login successful"
	        redirect_back_or_default :controller => "goals", :action => "index"
	      else
	        flash.now['notice']  = "Login unsuccessful"
	        @login = @params[:user_login]
	      end
	    end
	  end
  
	  def signup
	    @user = User.new(@params[:user])
	
	    if @request.post? and @user.save
	      @session[:user] = User.authenticate(@user.login, @params[:user][:password])
	      flash['notice']  = "Signup successful"
	     redirect_back_or_default :controller => "goals", :action => "index"
	    end      
	  end  
	  
	  def logout
	    @session[:user] = nil
	  end
	    
	  def welcome
	  end
  
end
