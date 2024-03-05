class AddReferencesToMessages < ActiveRecord::Migration[7.1]
  def change

    add_reference :messages, :receiver, null: false, foreign_key: { to_table: :users }
    add_reference :messages, :sender, null: false, foreign_key: { to_table: :users }

    add_reference :messages, :request, null: false, foreign_key: true

  end
end
