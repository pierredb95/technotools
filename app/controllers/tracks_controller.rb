class TracksController < ApplicationController
  def new
    @track = Track.new
    authorize @track
  end

  def create
    @track = Track.new(artist_params)
    # @artist.user = current_user
    authorize @track
    if @track.save
      redirect_to track_path(@track)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end
end
