# encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    if user.is?("管理员")
      can :manage, :all
    else
      can :create, Order
      can :read, Order
      can :read, Tour
      can :change_password, User, :id => user.id
    end

  end
end
