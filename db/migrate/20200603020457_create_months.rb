class CreateMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :months do |t|
      t.string :month
      t.integer :year
      t.belongs_to :user

      t.timestamps
    end
  end
end
