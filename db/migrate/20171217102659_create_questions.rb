class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :name
      t.integer :question_type
      t.string :description
      t.jsonb :values
      t.integer :status

      t.timestamps
    end
  end
end
