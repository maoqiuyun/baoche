# encoding: utf-8
class SessionsController < ApplicationController
  
  skip_before_filter :login_required 
  
  def index
    render :layout =>  false
  end
  
  def verify
    user_name = params[:name]
    password = params[:password]
    
    user = User.where(["name = ? and password = ?" ,user_name, password]).first
    if user.nil?
      flash[:error] = "用户名或密码错误"
      redirect_to root_path
    else
      session[:user] = user
      redirect_to orders_path
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end
end
