class CreateTechnicianOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :technician_orders do |t|
      t.references :technician, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
