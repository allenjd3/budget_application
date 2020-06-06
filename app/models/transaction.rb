class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :month

  monetize :spent_cents
  
end
