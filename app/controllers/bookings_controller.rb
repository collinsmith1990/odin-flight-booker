class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.new()
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    byebug
    if @booking.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
