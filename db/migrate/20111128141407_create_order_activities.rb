class CreateOrderActivities < ActiveRecord::Migration
  def change
    create_table :order_activities do |t|
      t.integer  :order_id
      t.string :before_change
      t.string :after_change
      t.string :attr_name
      t.string :user_id
      t.timestamps
    end
  end
end
