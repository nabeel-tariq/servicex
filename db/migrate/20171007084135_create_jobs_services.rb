class CreateJobsServices < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_services do |t|
      t.references :job, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
