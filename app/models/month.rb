class Month < ApplicationRecord
    has_many :transactions
    has_many :items
    has_many :categories
    has_many :paychecks

    belongs_to :user
end
