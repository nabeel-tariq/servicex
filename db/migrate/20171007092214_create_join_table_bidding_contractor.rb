class CreateJoinTableBiddingContractor < ActiveRecord::Migration[5.0]
  def change
    create_table :biddings_contractors, :id => false do |t|
      t.references :bidding, :contractor
    end
    add_index :biddings_contractors, [:bidding_id, :contractor_id]
  end
end