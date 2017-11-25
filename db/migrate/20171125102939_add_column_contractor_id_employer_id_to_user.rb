class AddColumnContractorIdEmployerIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :employer, foreign_key: true
    add_reference :users, :contractor, foreign_key: true
  end
end
