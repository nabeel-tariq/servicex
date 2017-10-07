class AddColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :amount, :string
    add_column :orders, :remarks, :text
    add_column :orders, :ending_date, :datetime
  end
end
