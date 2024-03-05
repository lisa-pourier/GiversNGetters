class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.integer :request_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
