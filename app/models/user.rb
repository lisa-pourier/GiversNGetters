class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests, dependent: :destroy
  has_many :messages
  # these are the agreements that the user has received
  has_many :received_agreements, class_name: 'Agreement', foreign_key: 'receiver_id'

  # these are the agreements that the user has submitted
  has_many :sent_agreements, class_name: 'Agreement', foreign_key: 'sender_id'

  has_many :feedbacks, through: :requests

  has_many :user_expertises, dependent: :destroy
  has_many :user_interests, dependent: :destroy
  has_many :expertises, through: :user_expertises
  has_many :interest_expertises, through: :user_interests, source: :expertise

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  has_one_attached :avatar

end
