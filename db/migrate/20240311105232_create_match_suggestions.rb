class CreateMatchSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :match_suggestions do |t|

      t.timestamps
    end
  end
end
