class FilmController < ApplicationController
  def index
    # @page = params[:id]
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end
end
