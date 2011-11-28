class OrderActivity < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  
  default_scope where("attr_name != 'updated_at'")
end
