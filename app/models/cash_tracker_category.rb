class CashTrackerCategory < ApplicationRecord
  belongs_to :cash_tracker
  belongs_to :category
end
