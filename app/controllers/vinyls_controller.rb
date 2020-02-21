class VinylsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  # CREATE
  def new
    @vinyl = Vinyl.new
    @artist = Artist.new
    @review = Review.new
    authorize @vinyl
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    user_artist = params[:vinyl][:artist]
    if Artist.find_by(name: user_artist).nil?
      artist = Artist.create(name: user_artist)
    else
      artist = Artist.find_by(name: user_artist)
    end
    @vinyl.artist = artist
    @vinyl.user = current_user
    @vinyl.address = current_user.address
    authorize @vinyl
    if @vinyl.save
      redirect_to vinyl_path(@vinyl)
    else
      render :new
    end
  end

  # READ

  def index
    @vinyls = policy_scope(Vinyl)
    if params[:search][:query].present?
      sql_query = " \
            vinyls.address ILIKE :query \
            OR genres.name ILIKE :query \
            OR artists.name ILIKE :query \
            OR users.pseudo ILIKE :query \


          "
      @vinyls = Vinyl.joins(:genre).joins(:artist).joins(:user).where(sql_query, query: "%#{params[:search][:query]}%")
    else
      @vinyls = Vinyl.all
    end
    @markers = @vinyls.map do |vinyl|
      {
        lat: vinyl.latitude,
        lng: vinyl.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { vinyl: vinyl }),
        image_url: helpers.asset_url('vinyl.png')
      }
    end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @review = Review.new
    authorize @vinyl
    @booking = Booking.new
    @bookings       = Booking.where(vinyl_id: @vinyl.id)
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_rent,
        to:   booking.end_rent
      }
    end
  end

  # UPDATE
  def edit
    @vinyl = Vinyl.find(params[:id])
    authorize @vinyl
  end

  def update
    @vinyl = Vinyl.find(params[:id])
    authorize @vinyl
    if @vinyl.update(vinyl_params)
      redirect_to vinyl_path(@vinyl)
    else
      render :edit
    end
  end

  # DELETE
  def destroy
    @vinyl = Vinyl.find(params[:id])
    authorize @vinyl
    @vinyl.destroy
    redirect_to vinyls_path
  end

  # SECURITY FOR PARAMS
  private

  def vinyl_params
    params.require(:vinyl).permit(:name, :release_date, :price_per_day, :artist_id, :genre_id, :photo)
  end

end
