class TracksController < ApplicationController
  def new
    @track = Track.new
    authorize @track
  end

  def create
    @track = Track.new(tack_params)
    vinyl = Vinyl.find(params[:vinyl_id])
    @track.vinyl = vinyl
    # @artist.user = current_user
    authorize @track
    if @track.save
      redirect_to vinyl_path(vinyl)
    else
      redirect_to vinyl_path(vinyl), :alert => "Enter a valid title and a correct Youtube url "
    end
  end

  def edit
  end

  def update
  end

  private

  def tack_params
    params.require(:track).permit(:name, :url, :vinyl_id)
  end
end
