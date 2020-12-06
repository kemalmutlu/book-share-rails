class AddUsernameToUsers < ActiveRecord::add_index :users, :username, unique: trueMigration[6.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
