class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.integer :expertise_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
