class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :order, foreign_key: true
      t.integer :status_id

      t.timestamps
    end
  end
end
