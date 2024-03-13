class ChangeRequestIdInAgreements < ActiveRecord::Migration[7.1]
  def change
    change_column_null :agreements, :request_id, true
  end
end
