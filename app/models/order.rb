# encoding: utf-8
class Order < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :tour
  belongs_to :location
  has_many :order_activities
  
  after_update :logs
  
  validates_presence_of :tour_id, :location_id, :user_id, :tel, :departure_date, :link_name
  validates :num, :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  
  STATUS = {
    "待生效" => 0,
    "已生效" => 1,
    "已取消" => -1
  }
  
  def self.departure_date_option
    options = []
    0.upto(5) do |i|
      options << [Date.today + i,Date.today + i ]
    end
    options
  end
  
  private
  def logs
    self.changes.each_pair do |key, value|
      activity = OrderActivity.new
      activity.user_id = self.user_id
      activity.order_id = self.id
      activity.attr_name = key
      activity.before_change = value[0]
      activity.after_change = value[1]
      activity.save!
    end    
  end
end