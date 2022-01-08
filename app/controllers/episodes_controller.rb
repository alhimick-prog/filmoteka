class EpisodesController < ApplicationController
  def show
    @episode = Episode.find(params[:id])
    authorize(@episode.season.film, :show?)
    @season = @episode.season
  end

  def new
    @season = Season.find(params[:season_id])
    authorize(@season.film, :edit?)
    @episode = @season.episode.new
  end

  def create
    @season = Season.find(params[:season_id])
    authorize(@season.film, :edit?)
    @episode = @season.episode.new(episode_params)

    if @episode.save
      redirect_to @episode
    else
      render :new
    end
  end

  def edit
    @episode = Episode.find(params[:id])
    authorize(@episode.season.film, :edit?)
  end

  def update
    @episode = Episode.find(params[:id])
    authorize(@episode.season.film, :edit?)

    if @episode.update(episode_params)
      redirect_to @episode
    else
      render :edit
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    authorize(@episode.season.film, :edit?)
    season_id = @episode.season_id
    @episode.destroy!

    redirect_to season_path(season_id)
  end

  private

  def episode_params
    params.require(:episode).permit(:title, :description)
  end
end
