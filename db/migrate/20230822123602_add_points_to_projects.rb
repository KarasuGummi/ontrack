class AddPointsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :points, :integer, default: 10
  end
end
