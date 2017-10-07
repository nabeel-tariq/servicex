class ChangeColumnNameStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :contractor_services, :status_id, :status
    rename_column :jobs, :status_id, :status
    rename_column :orders, :status_id, :status
    rename_column :payments, :status_id, :status
  end
end
