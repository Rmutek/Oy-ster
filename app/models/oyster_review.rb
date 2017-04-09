class OysterReview < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  belongs_to :oyster
end
