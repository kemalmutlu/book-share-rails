class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :book, null: false, foreign_key: true, on_delete: :cascade 
      t.references :recommended_book, index: true, foreign_key: { to_table: :books }, on_delete: :cascade
      t.integer :status, :null => false, :default => 3
      t.boolean :deleted, :null => false, :default => 0
      t.timestamps
    end
  end
end


