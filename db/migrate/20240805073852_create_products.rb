class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.text :colors, array: true, default: []
      t.text :sizes, array: true, default: []
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
