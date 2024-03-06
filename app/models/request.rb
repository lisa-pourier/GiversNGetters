class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expertise

  has_many :messages
  has_many :agreements
  has_many :feedbacks
end
