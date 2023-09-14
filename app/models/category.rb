class Category < ApplicationRecord
  has_many :cash_tracker_categories
  has_many :cash_trackers, through: :cash_tracker_categories
  
  validates :name, presence: true
  validates :icon, presence: true
end
