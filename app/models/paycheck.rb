class Paycheck < ApplicationRecord
  belongs_to :month
  belongs_to :user
  monetize :payday_cents
end
