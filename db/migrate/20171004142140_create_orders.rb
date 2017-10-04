class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :contractor, foreign_key: true
      t.references :job, foreign_key: true
      t.references :bidding, foreign_key: true
      t.integer :status_id

      t.timestamps
    end
  end
end
