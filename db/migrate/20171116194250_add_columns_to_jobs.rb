class AddColumnsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :ad_type, :integer
  end
end
