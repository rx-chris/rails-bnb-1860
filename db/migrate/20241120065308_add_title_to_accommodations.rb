class AddTitleToAccommodations < ActiveRecord::Migration[7.1]
  def change
    add_column :accommodations, :title, :string, null: false, default: ''
  end
end
