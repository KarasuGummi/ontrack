class ChangeProjectStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :status, :integer, default: 0, using: 'status::integer'
  end
end
