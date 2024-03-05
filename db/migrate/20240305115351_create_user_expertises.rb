class CreateUserExpertises < ActiveRecord::Migration[7.1]
  def change
    create_table :user_expertises do |t|

      t.timestamps
    end
  end
end
