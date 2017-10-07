class AddColumnToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :address_1, :string
    add_column :locations, :address_2, :string
    add_column :locations, :zip_code, :string
    add_reference :locations, :city, foreign_key: true
    add_reference :locations, :state, foreign_key: true
  end
end
