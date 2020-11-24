class AddTradableToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :tradable, :boolean, :null => false, :default => 0
  end
end
