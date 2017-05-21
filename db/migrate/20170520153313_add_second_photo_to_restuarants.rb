class AddSecondPhotoToRestuarants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :image2, :string
    add_column :restaurants, :image3, :string
    add_column :restaurants, :image4, :string
    add_column :restaurants, :image5, :string
  end
end
