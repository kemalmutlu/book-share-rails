class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pagecount
      t.boolean :status
     
      t.timestamps
    end
  end
end
