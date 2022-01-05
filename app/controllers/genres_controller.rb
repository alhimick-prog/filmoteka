class GenresController < ApplicationController
  def index
    @genres = policy_scope(Genre.all)
    authorize(Genre.new)
  end

  def new
    @genre = Genre.new
    authorize(@genre)
  end

  def create
    @genre = Genre.new(genre_params)
    authorize(@genre)

    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    authorize(@genre)
  end

  def update
    @genre = Genre.find(params[:id])
    authorize(@genre)

    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    authorize(@genre)
    @genre.destroy!

    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
