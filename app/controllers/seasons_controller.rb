class SeasonsController < ApplicationController
  def index
    @film = Film.find(params[:id])
    @seasons = @film.seasons.all
  end

  def show
    @season = Season.find(params[:id])
    @film = Film.find(@season.film_id)
    @episodes = @season.episode.all
  end

  def new
    @film = Film.find(params[:id])
    @season = @film.seasons.new
  end

  def create
    @film = Film.find(params[:id])
    @season = @film.seasons.new(season_params)

    if @season.save
      redirect_to @season
    else
      render :new
    end
  end

  def edit
    @season = Season.find(params[:id])
  end

  def update
    @season = Season.find(params[:id])

    if @season.update(season_params)
      redirect_to @season
    else
      render :edit
    end
  end

  def destroy
    @season = Season.find(params[:id])
    film_id = @season.film_id
    @season.destroy!

    redirect_to seasons_path(film_id)
  end

  private

  def season_params
    params.require(:season).permit(:title, :description, :release_date)
  end
end
