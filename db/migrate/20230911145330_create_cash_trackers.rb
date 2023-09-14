class CreateCashTrackers < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_trackers do |t|
      t.references :categories, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :amount
    
      t.timestamps
    end
  end
end
