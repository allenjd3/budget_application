class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.monetize :planned
      t.belongs_to :user, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :category, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :month, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
