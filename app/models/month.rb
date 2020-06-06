class Month < ApplicationRecord
    has_many :transactions
    has_many :items
    has_many :categories

    belongs_to :user
end
