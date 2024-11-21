class AddDataToAccommodations < ActiveRecord::Migration[7.1]
  def change
    add_column :accommodations, :city, :string
    add_column :accommodations, :country, :string
    add_column :accommodations, :max_guest_count, :integer
    add_column :accommodations, :description, :text
  end
end
