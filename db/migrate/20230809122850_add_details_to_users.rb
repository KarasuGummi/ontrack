class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :grade, :string
    add_column :users, :subject, :string
    add_column :users, :learning_goal, :string
  end
end
