class UpdateReferencesToReviews < ActiveRecord::Migration[7.1]
  def change
    Review.destroy_all

    add_reference :reviews, :booking, null: false, foreign_key: true
    remove_reference :reviews, :accommodation, foreign_key: true, index: false
    remove_reference :reviews, :user, foreign_key: true, index: false
  end
end
