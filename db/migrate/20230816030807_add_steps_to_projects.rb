class AddStepsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :steps, :string, array: true, default: []
  end
end
