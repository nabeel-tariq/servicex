class CreateEmployers < ActiveRecord::Migration[5.0]
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_active

      t.timestamps
    end
  end
end
