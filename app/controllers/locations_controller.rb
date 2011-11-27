class LocationsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  def index
    index!
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
     @location = Location.find(params[:id])
     render :action => :new
   end

   def update
     update! do |success, failure|
       success.html { redirect_to :action => :index }
       failure.html { render :action => :new }
     end
   end
end
