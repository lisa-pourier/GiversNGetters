class ChangeMessagesRequestIdToNullTrue < ActiveRecord::Migration[7.1]
  def change
    change_column_null :messages, :request_id, true
  end
end
