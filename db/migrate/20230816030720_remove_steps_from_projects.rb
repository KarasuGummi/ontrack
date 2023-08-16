class RemoveStepsFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :steps
  end
end
