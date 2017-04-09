class Oyster < ApplicationRecord
  has_many :oyster_review
  has_many :users, through: :oyster_review
  has_many :restaurants, through: :oyster_review
end
