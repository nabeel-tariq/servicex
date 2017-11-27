class ChangeColumnTypeJob < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :budget,'integer USING CAST(budget AS integer)'
  end
end
