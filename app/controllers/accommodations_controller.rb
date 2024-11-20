class AccommodationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @accommodation = Accommodation.find(params[:id])
  end
end
