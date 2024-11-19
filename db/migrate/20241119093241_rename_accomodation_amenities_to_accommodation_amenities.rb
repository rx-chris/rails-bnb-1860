class RenameAccomodationAmenitiesToAccommodationAmenities < ActiveRecord::Migration[7.1]
  def change
    rename_table('accomodation_amenities', 'accommodation_amenities')
  end
end
