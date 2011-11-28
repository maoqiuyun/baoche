# encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  inherit_resources
  
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
    @user = User.find(params[:id])
    render :action => :new
  end

  def update
    update! do |success, failure|
      success.html { redirect_to :action => :index }
      failure.html { render :action => :new }
    end
  end
  
  def change_password
  end
  
  def reset_passwowrd
    @user = User.find(params[:id])
    @user.update_attribute(:password,User::DEFAULT_PASSWORD)
    p @user
    flash[:notice] = "密码重置成功"
    redirect_to users_path  
  end
  
end
