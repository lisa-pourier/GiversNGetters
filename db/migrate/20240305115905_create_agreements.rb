class CreateAgreements < ActiveRecord::Migration[7.1]
  def change
    create_table :agreements do |t|
      t.integer :request_id
      t.string :title
      t.text :description
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
