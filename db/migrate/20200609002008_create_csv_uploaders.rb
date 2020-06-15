class CreateCsvUploaders < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_uploaders do |t|
      t.belongs_to :month, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
