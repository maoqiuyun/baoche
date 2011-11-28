class Location < ActiveRecord::Base
  has_many :orders, :dependent => :restrict
  validates :name, :presence => true, :uniqueness => true
end
