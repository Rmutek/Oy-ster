class AddPriceTag < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :price, :string
  end
end
