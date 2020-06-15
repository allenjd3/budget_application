class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :month, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
