class AdminController < ApplicationController
  
  before_filter :authorize
  
  
  def authorize 
    if not (@session[:user].login == "dustin" or @session[:user].login == "alea" or @session[:user].login == "pushsingh" or @session[:user].login == "ianeslick")
       flash[:notice] = 'You do not have authorization to view this page.'
       redirect_to :controller => 'user', :action => 'login'
    end
  end
  
  
  def index
    list
    render :action => 'list'
  end

  def list
    @user_pages, @users = paginate :user, :per_page => 10
    @structure_pages, @structures = paginate :structure, :per_page => 20

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def new_struct
    @struct = Structure.new
  end
  
  def create_struct
    @struct = Structure.new(params[:struct])
    if @struct.save
       redirect_to :action => 'list'
    else
       render :action => 'new_struct'
    end
  end

  def edit_struct
    @struct = Structure.find(params[:id])
  end


  def update_structure
    @struct = Structure.find(params[:id])
    if @struct.update_attributes(params[:struct])
      flash[:notice] = 'Structure was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
  

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action => 'show', :id => @user
    else
      render :action => 'edit'
    end
  end



  def destroy
    User.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
