class Category < ApplicationRecord
  belongs_to :user
  belongs_to :month
  has_many :items

  validates :name, presence: true

end
