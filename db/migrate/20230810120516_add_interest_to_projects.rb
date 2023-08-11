class AddInterestToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :interest, :string
  end
end
