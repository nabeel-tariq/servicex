class CreateContractorServices < ActiveRecord::Migration[5.0]
  def change
    create_table :contractor_services do |t|
      t.references :contractor, foreign_key: true
      t.references :service, foreign_key: true
      t.integer :status_id
      t.string :status_changed_at

      t.timestamps
    end
  end
end
