class AccommodationsController < ApplicationController
  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    raise
    @accommodation.save
    redirect_to accommodations_path
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:type_of_place, :price, :rating, :address, :bed_count, :bedroom_count, :bathroom_count)
  end
end
