class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.integer  :price
      t.timestamps
    end
  end
end
