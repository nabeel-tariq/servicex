class AddColumnToBidding < ActiveRecord::Migration[5.0]
  def change
    add_column :biddings, :description, :string
    add_column :biddings, :status, :integer
    add_column :biddings, :amount, :integer
    add_column :biddings, :time, :datetime
  end
end
