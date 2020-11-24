class RemoveUserIdFromOffer < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :user_id, :integer
  end
end
