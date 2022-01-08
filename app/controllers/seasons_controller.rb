class SeasonsController < ApplicationController
  def index
    @film = Film.find(params[:film_id])
    authorize(@film, :show?)
    @seasons = policy_scope(@film.seasons)
  end

  def show
    @season = Season.find(params[:id])
    authorize(@season, :show?)
    @film = @season.film
    authorize(@film, :show?)
    @episodes = policy_scope(@season.episode)
  end

  def new
    @film = Film.find(params[:film_id])
    authorize(@film, :edit?)
    @season = @film.seasons.new
  end

  def create
    @film = Film.find(params[:film_id])
    authorize(@film, :edit?)
    @season = @film.seasons.new(season_params)

    if @season.save
      redirect_to @season
    else
      render :new
    end
  end

  def edit
    @season = Season.find(params[:id])
    authorize(@season.film, :edit?)
  end

  def update
    @season = Season.find(params[:id])
    authorize(@season.film, :edit?)

    if @season.update(season_params)
      redirect_to @season
    else
      render :edit
    end
  end

  def destroy
    @season = Season.find(params[:id])
    authorize(@season.film, :edit?)
    film_id = @season.film_id
    @season.destroy!

    redirect_to seasons_path(film_id)
  end

  private

  def season_params
    params.require(:season).permit(:title, :description, :release_date)
  end
end
