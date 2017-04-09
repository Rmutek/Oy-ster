class User < ApplicationRecord
  has_secure_password
  has_many :oyster_review
  has_many :restaurants, through: :oyster_review
  has_many :oysters, through: :oyster_review
end
