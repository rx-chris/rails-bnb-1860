class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @accommodations = Accommodation.all
    @amenities = Amenity.all
  end

  def show
    @accommodation = Accommodation.find(params[:id])
    @marker = [
      {
      lat: @accommodation.latitude,
      lng: @accommodation.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {accommodation: @accommodation})
      }]
  end

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
    params.require(:accommodation).permit(:type_of_place, :price, :rating, :address, :bed_count, :bedroom_count, :bathroom_count, :title, :city, :country, :max_guest_count, :description)
  end

end
