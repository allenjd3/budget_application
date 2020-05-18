class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :planned
      t.belongs_to :user, null: false, foreign_key: true
      t.string :category_belongs_to

      t.timestamps
    end
  end
end
