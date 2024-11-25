class BookingsController < ApplicationController
  def index
    @pending_bookings = current_user.booking_requests.where(status: 'Pending')
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
