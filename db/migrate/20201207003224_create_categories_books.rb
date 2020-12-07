class CreateCategoriesBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books_categories, :id => false do |t|
      t.references :book, null: false, foreign_key: true, on_delete: :cascade
      t.references :category, null: false, foreign_key: true, on_delete: :cascade
    end
  end
end
