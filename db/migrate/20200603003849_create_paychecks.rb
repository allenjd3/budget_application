class CreatePaychecks < ActiveRecord::Migration[6.0]
  def change
    create_table :paychecks do |t|
      t.string :name
      t.monetize :payday
      t.datetime :payday_date
      t.belongs_to :user, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :month, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
