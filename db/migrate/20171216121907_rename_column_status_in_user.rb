class RenameColumnStatusInUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :status, :is_active
  end
end
