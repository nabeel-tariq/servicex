class AddColumnToTechnician < ActiveRecord::Migration[5.0]
  def change
    add_reference :technicians, :contractor, foreign_key: true
  end
end
