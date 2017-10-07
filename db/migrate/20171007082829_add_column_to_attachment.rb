class AddColumnToAttachment < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :status, :integer
    add_column :attachments, :image_type, :string
  end
end
