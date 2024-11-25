class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @accommodation = Accommodation.find(params[:accommodation_id])
    @booking.accommodation = @accommodation
    if @booking.save
      redirect_to accommodation_path(@accommodation), notice: "success"
    else
      render "accommodations/show", status: :unprocessable_entity
    end

  end
  def index
    @pending_booking_requests = current_user.booking_requests.where(status: 'Pending')
    @pending_bookings = current_user.bookings.where(status: 'Pending')
  end


  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    @booking.save
    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.declined!
    @booking.save
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :no_of_adults, :no_of_childs, :no_of_infants, :no_of_pets)
  end

end
