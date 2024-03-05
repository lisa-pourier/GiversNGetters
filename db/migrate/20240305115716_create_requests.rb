class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references :expertise, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
