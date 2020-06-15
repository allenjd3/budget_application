class CsvUploader < ApplicationRecord
  has_one_attached :csvbank
  belongs_to :month
end
