class AddColumnStatusToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :is_active, :boolean, default: true
  end
end
