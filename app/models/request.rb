class Request < ApplicationRecord
  belongs_to :user
  belongs_to :expertise

  has_many :messages
  has_many :agreements, dependent: :destroy
  has_many :agreements, dependent: :nullify
  has_many :feedbacks
end
