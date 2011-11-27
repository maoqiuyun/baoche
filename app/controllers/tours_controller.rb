class ToursController < ApplicationController
  
  inherit_resources
  load_and_authorize_resource
  def index
    @search = Tour.search params[:search]
    @tours = @search.order("id desc").paginate :page => params[:page], :per_page => 10
  end
  
  def new
    new!
  end
  
  def create
    create! do |success, failure|
      success.html { redirect_to :action => :index }
      failure.html { render :action => :new }
    end
  end
  
  def edit
     @tour = Tour.find(params[:id])
     render :action => :new
   end

   def update
     update! do |success, failure|
       success.html { redirect_to :action => :index }
       failure.html { render :action => :new }
     end
   end
end
