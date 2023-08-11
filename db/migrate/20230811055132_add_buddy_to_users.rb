class AddBuddyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :buddy, null: true, foreign_key: true
  end
end
