class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question_content
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
