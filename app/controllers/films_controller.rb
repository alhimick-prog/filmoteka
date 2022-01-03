class FilmsController < ApplicationController
  def index
    @films = Film.paginate(page: params[:page])
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    @film.film_categories_attributes = film_categories_attributes
    @film.film_genres_attributes = film_genres_attributes


    if @film.save
      redirect_to @film
    else
      render :new
    end
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    @film.film_categories_attributes = film_categories_attributes
    @film.film_genres_attributes = film_genres_attributes

    if @film.update(film_params)
      redirect_to @film
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy!

    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:title,
                                 :description,
                                 :trailer_url,
                                 :release_date,
                                 :duration,
                                 :age_restriction,
                                 :creator_id)
  end

  def film_categories_attributes
    checked_categories = params[:categories]
    existing_film_categories = @film.film_categories
    existing_categories_ids = existing_film_categories.map(&:category_id).map(&:to_s)
    to_remove = existing_categories_ids - checked_categories
    to_add = checked_categories - existing_categories_ids
    remove_attrs = to_remove.map do |category_to_remove|
      film_cat = existing_film_categories.detect { |cat| cat.category_id.to_s == category_to_remove }
      {
        id: film_cat.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |category_to_add|
      {
        category_id: category_to_add
      }
    end

    remove_attrs + add_attrs
  end

  def film_genres_attributes
    checked_genres = params[:genres]
    existing_film_genres = @film.film_genres
    existing_genres_ids = existing_film_genres.map(&:genre_id).map(&:to_s)
    to_remove = existing_genres_ids - checked_genres
    to_add = checked_genres - existing_genres_ids
    remove_attrs = to_remove.map do |genre_to_remove|
      film_genr = existing_film_genres.detect { |genr| genr.genre_id.to_s == genre_to_remove }
      {
        id: film_genr.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |genre_to_add|
      {
        genre_id: genre_to_add
      }
    end

    remove_attrs + add_attrs
  end
end
