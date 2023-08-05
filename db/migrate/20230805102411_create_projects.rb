class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :deadline
      t.boolean :status
      t.string :category
      t.integer :points
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
