class BookingsController < ApplicationController
  # CREATE
  def new
    @booking = Booking.new
  end

  def create

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
  end
end
