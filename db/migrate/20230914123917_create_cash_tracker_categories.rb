class CreateCashTrackerCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_tracker_categories do |t|
      t.references :cash_tracker, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
