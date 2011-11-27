# encoding: utf-8
class OrdersController < ApplicationController
  load_and_authorize_resource
  inherit_resources
  
  def index
    @search = Order.search params[:search]
    @orders = @search.order("id desc").paginate :page => params[:page], :per_page => 10
    render "my_orders" unless @current_user.is?("管理员")
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
end
