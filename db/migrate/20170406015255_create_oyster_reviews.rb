class CreateOysterReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :oyster_reviews do |t|
      t.string :title
      t.text :body
      t.string :oyster_quality
      t.string :shucking_quality
      t.string :presentation
      t.integer :user_id
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :oyster_id

      t.timestamps
    end
  end
end
