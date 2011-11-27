# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_required
  helper_method :current_user
  
  private
  def login_required
    if session[:user].nil?
      flash[:error] = "请登录"
      redirect_to root_path
    else
       @current_user = Thread.current[:current_user] = session[:user]   
    end
  end
  
  def current_user
    @current_user ||= User.find session[:user]
  end
end
