class Expertise < ApplicationRecord
  has_many :user_expertise
  has_many :user_interest
  # belongs_to :user_interest
  has_many :users, through: :user_expertise
end
