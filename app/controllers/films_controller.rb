class FilmsController < ApplicationController
  include FilmAttributes

  def index
    @films = policy_scope(Film.paginate(page: params[:page]))
  end

  def show
    @film = Film.find(params[:id])
    authorize(@film)
  end

  def new
    @film = Film.new
    authorize(@film)
  end

  def create
    @film = Film.new(film_params)
    assign_film_attributes
    authorize(@film)

    if @film.save
      redirect_to @film
    else
      render :new
    end
  end

  def edit
    @film = Film.find(params[:id])
    authorize(@film)
  end

  def update
    @film = Film.find(params[:id])
    assign_film_attributes
    authorize(@film)

    if @film.update(film_params)
      redirect_to @film
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    authorize(@film)
    @film.destroy!

    redirect_to films_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :description, :trailer_url, :release_date, :duration,
                                 :age_restriction, :creator_id, :tags_string, :countries_string,
                                 :actors_string, :directors_string, :approved)
  end

  def assign_film_attributes
    @film.assign_attributes(
      film_categories_attributes: film_categories_attributes,
      film_genres_attributes: film_genres_attributes,
      film_tags_attributes: film_tags_attributes,
      film_countries_attributes: film_countries_attributes,
      film_people_attributes: film_people_attributes,
      creator_id: current_user.id
    )
  end
end
