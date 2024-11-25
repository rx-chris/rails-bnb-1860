class AddColumnstToBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :guest_count, :integer
    add_column :bookings, :no_of_adults, :integer
    add_column :bookings, :no_of_childs, :integer
    add_column :bookings, :no_of_infants, :integer
    add_column :bookings, :no_of_pets, :integer
  end
end
