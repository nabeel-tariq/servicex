class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.references :locationable, polymorphic: true
      t.timestamps
    end
  end
end
