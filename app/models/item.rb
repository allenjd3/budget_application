class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :month
  has_many :transactions, dependent: :delete_all

  monetize :planned_cents

end
