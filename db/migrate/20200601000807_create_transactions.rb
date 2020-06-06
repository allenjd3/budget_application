class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :month, null: false, foreign_key: true
      t.monetize :spent
      t.datetime :spent_date

      t.timestamps
    end
  end
end
