class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.integer :status_id
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
