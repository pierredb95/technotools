class BookingsController < ApplicationController
  before_action :authenticate_user!
  # CREATE
  def new
    @booking = Booking.new
    @vinyl = Vinyl.find(params[:vinyl_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @vinyl = Vinyl.find(params[:vinyl_id])
    @booking.vinyl = @vinyl
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  # READ
  def index
    @bookings = policy_scope(Vinyl)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  # UPDATE
  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  # DELETE
  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  # SECURITY FOR PARAMS
  private

  def booking_params
    params.require(:booking).permit(:start_rent, :end_rent, :vinyl_id)
  end
end
