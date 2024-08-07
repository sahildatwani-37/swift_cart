class AddIndexAndForeignKeyToCategories < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :parent_id
    add_foreign_key :categories, :categories, column: :parent_id
  end
end
