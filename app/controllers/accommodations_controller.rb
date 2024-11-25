class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @accommodations = Accommodation.all
    @amenities = Amenity.all

    # filter by type of place
    if(params.key?(:type_of_place) and params[:type_of_place] != "any")
      @accommodations = @accommodations.where(type_of_place: params[:type_of_place])
    end

    # filter by price range
    if params.key?(:minimum_price)
      @accommodations = @accommodations.where('price >= ?', params[:minimum_price])
    end

    if params.key?(:maximum_price)
      @accommodations = @accommodations.where('price <= ?', params[:maximum_price])
    end
    # filter by rooms and beds
    if params.key?(:bed_count)
      @accommodations = @accommodations.where('bed_count >= ?', params[:bed_count])
    end
    if params.key?(:bedroom_count)
      @accommodations = @accommodations.where('bedroom_count >= ?', params[:bedroom_count])
    end
    if params.key?(:bathroom_count)
      @accommodations = @accommodations.where('bathroom_count >= ?', params[:bathroom_count])
    end
    # filter by amenities
    if params.key?(:amenities)
      @accommodations = @accommodations.select do |accom|
        params[:amenities].all? do |id|
          accom.amenities.find_by_id(id)
        end
      end
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
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
