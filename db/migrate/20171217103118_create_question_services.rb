class CreateQuestionServices < ActiveRecord::Migration[5.0]
  def change
    create_table :question_services do |t|
      t.references :service, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
