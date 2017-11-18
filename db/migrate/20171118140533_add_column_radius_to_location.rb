class AddColumnRadiusToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :radius, :string
  end
end
