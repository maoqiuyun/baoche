class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name
      t.string    :tel
      t.string    :password
      t.integer   :roles_mask,   :default => 0
      t.timestamps
    end
  end
end
