class RemoveContractorServiceIdFromBidding < ActiveRecord::Migration[5.0]
  def change
    remove_column :biddings, :contractor_service_id, :integer
  end
end
