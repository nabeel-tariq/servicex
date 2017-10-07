class AddColumnToContactNumber < ActiveRecord::Migration[5.0]
  def change
    add_column :contact_numbers, :number_type, :integer
    add_column :contact_numbers, :status, :integer
    add_column :contact_numbers, :otp, :string
    add_column :contact_numbers, :otp_sent_at, :datetime
  end
end
