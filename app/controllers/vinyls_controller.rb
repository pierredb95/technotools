class VinylsController < ApplicationController
  # CREATE
  def new
    @vinyl = Vinyl.new
  end

  def create
  end

  # READ
  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
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

  def vinyl_params
  end
end
