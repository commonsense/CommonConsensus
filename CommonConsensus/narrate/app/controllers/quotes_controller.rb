class QuotesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @quotes_pages, @quotes = paginate :quotes, :per_page => 50
  end

  def show
    @quotes = Quotes.find(params[:id], :order => "author")
  end

  def new
    @quotes = Quotes.new
  end

  def create
    @quotes = Quotes.new(params[:quotes])
    if @quotes.save
      flash[:notice] = 'Quotes was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @quotes = Quotes.find(params[:id])
  end

  def update
    @quotes = Quotes.find(params[:id])
    if @quotes.update_attributes(params[:quotes])
      flash[:notice] = 'Quotes was successfully updated.'
      redirect_to :action => 'show', :id => @quotes
    else
      render :action => 'edit'
    end
  end

  def destroy
    Quotes.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
