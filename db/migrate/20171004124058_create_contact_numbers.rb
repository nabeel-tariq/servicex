class CreateContactNumbers < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_numbers do |t|
      t.string :text_value
      t.references :contactable, polymorphic: true

      t.timestamps
    end
  end
end
