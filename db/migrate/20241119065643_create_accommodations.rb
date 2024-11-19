class CreateAccommodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accommodations do |t|
      t.string :type_of_place
      t.integer :price
      t.integer :rating
      t.string :address
      t.integer :bed_count
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
