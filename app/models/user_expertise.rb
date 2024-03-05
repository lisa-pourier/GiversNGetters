class UserExpertise < ApplicationRecord
  belongs_to :user
  belongs_to :expertise

end
