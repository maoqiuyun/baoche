# encoding: utf-8
class OrdersController < ApplicationController
  load_and_authorize_resource
  inherit_resources
  
  def index
    if @current_user.is?("管理员")
      @search = Order.search params[:search]
      @orders = @search.order("id desc").paginate :page => params[:page], :per_page => 20
    else
      @orders = @current_user.orders.order("id desc").paginate :page => params[:page], :per_page => 20
      render "my_orders"
    end
  end

  def new
    @tour = Tour.find(params[:tour_id])
    @order = @tour.orders.new
  end
  
  def create
    create! do |success, failure|
      success.html { redirect_to :action => :index }
      failure.html { render :action => :new }
    end
  end
  
  def edit
     @order = Order.find(params[:id])
   end

   def update
     update! do |success, failure|
       success.html { redirect_to :action => :index }
       failure.html { render :action => :new }
     end
  end
   
  def logs
     @order = Order.find(params[:id])
     @logs = @order.order_activities.order("id desc")
  end
end
