class CashTracker < ApplicationRecord
  has_many :cash_tracker_categories
  has_many :categories, through: :cash_tracker_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
