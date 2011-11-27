class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  :tour_id
      t.integer :location_id
      t.integer :user_id
      t.integer :num
      t.integer  :status,   :default => 0
      t.datetime :departure_date 
      t.string :link_name
      t.string :tel
      t.timestamps
    end
  end
end
