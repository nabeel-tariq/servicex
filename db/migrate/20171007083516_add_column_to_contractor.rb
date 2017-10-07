class AddColumnToContractor < ActiveRecord::Migration[5.0]
  def change
    add_column :contractors, :contractor_type, :integer
  end
end
