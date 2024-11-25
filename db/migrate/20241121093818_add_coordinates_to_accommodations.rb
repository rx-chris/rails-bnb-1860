class AddCoordinatesToAccommodations < ActiveRecord::Migration[7.1]
  def change
    add_column :accommodations, :latitude, :float
    add_column :accommodations, :longitude, :float
  end
end
