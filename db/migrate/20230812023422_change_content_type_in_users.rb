class ChangeContentTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :learning_goal, :text
  end
end
