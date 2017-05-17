class AddGuestTag < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :guests, :string
    add_column :restaurants, :guests_two, :string
  end
end
