class AddLatAndLong < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :lat, :decimal, precision: 20, scale: 10
    add_column :restaurants, :long, :decimal, precision: 20, scale: 10
  end
end
