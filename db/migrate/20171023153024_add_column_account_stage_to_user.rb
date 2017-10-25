class AddColumnAccountStageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_stage, :integer, default: 0
  end
end
