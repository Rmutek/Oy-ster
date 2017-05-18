class ChangeStringtoInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :oyster_reviews, :oyster_quality, :integer
    change_column :oyster_reviews, :shucking_quality, :integer
    change_column :oyster_reviews, :presentation, :integer
  end
end
