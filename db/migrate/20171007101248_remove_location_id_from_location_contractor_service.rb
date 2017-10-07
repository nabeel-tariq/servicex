class RemoveLocationIdFromLocationContractorService < ActiveRecord::Migration[5.0]
  def change
    remove_column :location_contractor_services, :location_id, :integer
  end
end
