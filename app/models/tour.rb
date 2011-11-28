class Tour < ActiveRecord::Base
  has_many :orders, :dependent => :restrict  
  validates :name, :presence => true, :uniqueness => true
  validates :price, :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  
  private
  
end
