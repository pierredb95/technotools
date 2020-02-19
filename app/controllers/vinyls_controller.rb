class VinylsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  # CREATE
  def new
    @vinyl = Vinyl.new
    @artists = Artist.all
    @genres = Genre.all
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    if @vinyl.save
      redirect_to vinyl_path(@vinyl)
    else
      render :new
    end
  end

  # READ

  def index
    if params[:query].present?
      sql_query = " \
        users.address ILIKE :query \
      "
      @vinyls = Vinyl.joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      @vinyls = Vinyl.all
    end
    # @markers = @vinyls.map do |vinyl|
    #   {
    #     lat: vinyl.latitude,
    #     lng: vinyl.longitude
    #   }
    # end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  # UPDATE
  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  def update
    @vinyl = Vinyl.find(params[:id])
    if @vinyl.update(vinyl_params)
      redirect_to vinyl_path(@vinyl)
    else
      render :edit
    end
  end

  # DELETE
  def destroy
    vinyl = Vinyl.find(params[:id])
    vinyl.destroy
    redirect_to vinyls_path
  end

  # SECURITY FOR PARAMS
  private

  def vinyl_params
    params.require(:vinyl).permit(:name, :release_date, :price_per_day, :artist_id, :genre_id, :photo)
  end
end
