class CreatePaychecks < ActiveRecord::Migration[6.0]
  def change
    create_table :paychecks do |t|
      t.string :name
      t.monetize :payday
      t.datetime :payday_date
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :month, null: false, foreign_key: true

      t.timestamps
    end
  end
end
