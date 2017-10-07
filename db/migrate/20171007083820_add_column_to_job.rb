class AddColumnToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :budget, :string
    add_column :jobs, :time, :datetime
  end
end
