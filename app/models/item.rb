class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :month
  has_many :transactions

  monetize :planned_cents

end
