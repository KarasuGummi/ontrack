class RemoveUserIdFromBuddies < ActiveRecord::Migration[7.0]
  def change
    remove_column :buddies, :user_id, :bigint
  end
end
