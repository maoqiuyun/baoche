# encoding: utf-8
class User < ActiveRecord::Base
  
  validates :name, :presence => true, :uniqueness => true
  validates :tel, :presence => true, :uniqueness => true
  validates :password, :presence => true
  
  has_many :orders, :dependent => :restrict
  has_many :order_activities
  
  DEFAULT_PASSWORD = 87654321
  
  ROLES = ["管理员"]
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def roles_text
   roles.join(" ")
  end
  
end
