class AddColumnsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :learning_goal, :string
    add_column :projects, :steps, :text
    add_column :projects, :vocab_words, :string, array: true, default: []
  end
end
