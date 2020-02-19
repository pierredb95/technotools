class ReviewsController < ApplicationController
  # before_action :authenticate_user!  hérite déjà de ApplicationController

  def new
    @review  = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review  = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to vinyl_path(@booking.vinyl)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @review = Review.find(params[:id])
    @review.booking = @booking
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to vinyl_path(@booking.vinyl)
    else
      render :edit
    end
  end

  # DELETE
  def destroy
    review = Review.find(params[:id])
    review.destroy
    # double check, ca depend de si on delete depuis la show redirect_to vinyl_path(@booking.vinyl)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :booking)
  end
end
