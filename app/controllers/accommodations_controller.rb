class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @accommodation = Accommodation.find(params[:id])
  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user = current_user

    amenities = params[:accommodation][:amenities].reject { |a| a.empty? }
    amenities.each do |amenity_id|
      @accommodation.amenities << Amenity.find(amenity_id)
    end
    if @accommodation.save
      redirect_to accommodations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:type_of_place, :price, :rating, :address, :bed_count, :bedroom_count, :bathroom_count, :title)
  end
end
