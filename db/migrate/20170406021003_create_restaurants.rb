class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.integer :yelp_id
      t.string :name
      t.string :address
      t.string :hours
      t.string :menu
      t.string :specials

      t.timestamps
    end
  end
end
