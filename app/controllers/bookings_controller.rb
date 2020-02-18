class BookingsController < ApplicationController
  # CREATE
  def new
    @booking = Booking.new
    @vinyl = Vinyl.find(params[:vinyl_id])
  end

  def create

    @booking = Booking.new(booking_params)
    @vinyl = Vinyl.find(params[:vinyl_id])
    @booking.vinyl = @vinyl
    @booking.user = current_user
      raise
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  # READ
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # UPDATE
  def edit
  end

  def update
  end

  # DELETE
  def destroy
  end

  # SECURITY FOR PARAMS
  private

  def booking_params
    params.require(:booking).permit(:start_rent, :end_rent, :vinyl_id)
  end
end
