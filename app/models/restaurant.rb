class Restaurant < ApplicationRecord
  has_many :oyster_review
  has_many :users, through: :oyster_review
  has_many :oysters, through: :oyster_review
end
