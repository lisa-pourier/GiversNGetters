class CreateAgreements < ActiveRecord::Migration[7.1]
  def change
    create_table :agreements do |t|
      t.references :request, null: false, foreign_key: true
      
      t.string :title
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
