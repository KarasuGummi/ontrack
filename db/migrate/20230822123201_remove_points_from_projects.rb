class RemovePointsFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :points, :integer
  end
end
