class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests
  has_many :messages
  has_many :agreements # these are the agreements that the user has received
  has_many :agreements_submitted, through: :requests, source: :agreements # these are the agreements that the user has submitted
  has_many :feedbacks, through: :requests

  has_many :user_expertises
  has_many :user_interests
  has_many :expertises, through: :user_expertises
  has_many :interest_expertises, through: :user_interests, source: :expertise
end
