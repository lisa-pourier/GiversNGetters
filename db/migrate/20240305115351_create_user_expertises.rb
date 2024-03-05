class CreateUserExpertises < ActiveRecord::Migration[7.1]
  def change
    create_table :user_expertises do |t|
      t.integer :user_id
      t.integer :expertise_id

      t.timestamps
    end
  end
end
