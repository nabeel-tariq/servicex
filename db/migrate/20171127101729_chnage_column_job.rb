class ChnageColumnJob < ActiveRecord::Migration[5.0]
  def change
      change_column :jobs, :status, :integer, default: 0
  end
end
