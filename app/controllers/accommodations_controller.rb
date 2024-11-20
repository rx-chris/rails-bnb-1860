class AccommodationsController < ApplicationController
  def show
    @accommodation = @Accommodation.find[params[:id]]
  end
end
