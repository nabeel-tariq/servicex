class CreateBiddings < ActiveRecord::Migration[5.0]
  def change
    create_table :biddings do |t|
      t.references :job, foreign_key: true
      t.references :contractor_service, foreign_key: true

      t.timestamps
    end
  end
end
