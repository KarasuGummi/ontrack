class ChangeCategoryNameToSubject < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :category, :subject
  end
end
