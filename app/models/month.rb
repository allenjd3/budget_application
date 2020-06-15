class Month < ApplicationRecord
    has_many :transactions, dependent: :delete_all
    has_many :items, dependent: :delete_all
    has_many :categories, dependent: :delete_all
    has_many :paychecks, dependent: :delete_all

    belongs_to :user

    def month_year
        "#{month}/#{year}"
    end
end
