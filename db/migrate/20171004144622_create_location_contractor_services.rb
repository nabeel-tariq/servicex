class CreateLocationContractorServices < ActiveRecord::Migration[5.0]
  def change
    create_table :location_contractor_services do |t|
      t.references :contractor_service, foreign_key: true
      t.references :location, foreign_key: true
      t.boolean :is_enable

      t.timestamps
    end
  end
end
