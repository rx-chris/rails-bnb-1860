class CreateAccomodationAmenities < ActiveRecord::Migration[7.1]
  def change
    create_table :accomodation_amenities do |t|
      t.references :amenity, null: false, foreign_key: true
      t.references :accommodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
