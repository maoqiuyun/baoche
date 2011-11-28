class UpdateDepartureDateToOrders < ActiveRecord::Migration
  def up
    change_column :orders, :departure_date, :date
  end

  def down
    change_column :orders, :departure_date, :datetime
  end
end
