class AddReferencesToUserExpertise < ActiveRecord::Migration[7.1]
  def change
     add_reference :user_expertises, :user, null: false, foreign_key: true # null is that it is a required field
     add_reference :user_expertises, :expertise, null: false, foreign_key: true
  end
end
