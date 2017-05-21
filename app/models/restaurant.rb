class Restaurant < ApplicationRecord
  has_many :oyster_review
  has_many :users, through: :oyster_review
  has_many :oysters, through: :oyster_review

  def average_oyster_quality
    sum = 0 
    oyster_review.each do |review| 
      sum += review.oyster_quality.to_i 
    end
    @average_oyster_quality = sum / oyster_review.length
  end

  def average_shucking_quality
    sum2 = 0 
    oyster_review.each do |review| 
      sum2 += review.shucking_quality.to_i
    end
    @average_shucking_quality = sum2 / oyster_review.length
  end

  def average_presentation
    sum3 = 0 
    oyster_review.each do |review| 
      sum3 += review.presentation.to_i
    end 
    @presentation = sum3 / oyster_review.length
  end
end
