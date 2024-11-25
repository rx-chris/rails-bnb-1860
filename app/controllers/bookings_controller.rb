class BookingsController < ApplicationController
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
end
