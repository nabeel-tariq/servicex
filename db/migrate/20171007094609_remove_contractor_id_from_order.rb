class RemoveContractorIdFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :contractor_id, :integer
  end
end
