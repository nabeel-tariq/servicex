class CreateContractors < ActiveRecord::Migration[5.0]
  def change
    create_table :contractors do |t|
      t.string :first_name
      t.string :last_name
      t.string :shop_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
