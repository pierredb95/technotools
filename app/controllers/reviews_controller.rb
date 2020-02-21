class ReviewsController < ApplicationController
  # before_action :authenticate_user!  hérite déjà de ApplicationController

  def new
    @review  = Review.new
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking

    authorize @booking
    authorize @review
  end

  def create
    @review  = Review.new(review_params)
    @booking = Booking.where(vinyl_id: params[:vinyl_id], user_id: current_user.id).last
    @review.booking = @booking

    authorize @review
    if @review.save
      redirect_to vinyl_path(@booking.vinyl)
    else
      redirect_to vinyl_path(params[:vinyl_id]), :alert => "Only users who booked this vinyl can write reviews"
    end
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @review = Review.find(params[:id])
    @review.booking = @booking
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    @booking = Booking.find(params[:booking_id])
    authorize @review
    if @review.update(review_params)
      redirect_to vinyl_path(@booking.vinyl)
    else
      render :edit
    end
  end

  # DELETE
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    # double check, ca depend de si on delete depuis la show redirect_to vinyl_path(@booking.vinyl)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :booking)
  end
end
