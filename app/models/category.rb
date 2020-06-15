class Category < ApplicationRecord
  belongs_to :user
  belongs_to :month
  has_many :items, dependent: :delete_all

  validates :name, presence: true

end
