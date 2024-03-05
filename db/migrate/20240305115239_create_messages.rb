class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.integer :request_id
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
