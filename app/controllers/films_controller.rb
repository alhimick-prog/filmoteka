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
    @film.film_tags_attributes = film_tags_attributes
    @film.film_countries_attributes = film_countries_attributes
    @film.film_people_attributes = film_people_attributes


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
    @film.film_tags_attributes = film_tags_attributes
    @film.film_countries_attributes = film_countries_attributes
    @film.film_people_attributes = film_people_attributes

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
                                 :creator_id,
                                 :tags_string,
                                 :countries_string,
                                 :actors_string,
                                 :directors_string)
  end

  def film_categories_attributes
    checked_categories = params[:categories] || []
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
    checked_genres = params[:genres] || []
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

  def film_tags_attributes
    tags = film_params[:tags_string].split(',').map(&:strip).uniq
    checked_tags = tags.map do |tag|
      Tag.find_or_create_by(name: tag).id
    end
    existing_film_tags = @film.film_tags
    existing_tags_ids = existing_film_tags.map(&:tag_id).map(&:to_s)
    to_remove = existing_tags_ids - checked_tags
    to_add = checked_tags - existing_tags_ids
    remove_attrs = to_remove.map do |tag_to_remove|
      film_tag = existing_film_tags.detect { |tag| tag.tag_id.to_s == tag_to_remove }
      {
        id: film_tag.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |tag_to_add|
      {
        tag_id: tag_to_add
      }
    end

    remove_attrs + add_attrs
  end

  def film_countries_attributes
    countries = film_params[:countries_string].split(',').map(&:strip)
    checked_countries = countries.map do |country|
      Country.find_by(name: country)&.id
    end
    checked_countries = checked_countries.compact
    existing_film_countries = @film.film_countries
    existing_countries_ids = existing_film_countries.map(&:country_id).map(&:to_s)
    to_remove = existing_countries_ids - checked_countries
    to_add = checked_countries - existing_countries_ids
    remove_attrs = to_remove.map do |country_to_remove|
      film_country = existing_film_countries.detect { |country| country.country_id.to_s == country_to_remove }
      {
        id: film_country.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |country_to_add|
      {
        country_id: country_to_add
      }
    end

    remove_attrs + add_attrs
  end

  def film_people_attributes
    film_actor_attributes + film_director_attributes
  end

  def film_actor_attributes
    actors = film_params[:actors_string].split(',').map(&:strip)
    checked_actors = actors.map do |person|
      Person.find_by(name: person)&.id
    end
    checked_actors = checked_actors.compact
    existing_film_actors = @film.film_people.where(role: 'Actor')
    existing_actors_ids = existing_film_actors.map(&:person_id).map(&:to_s)
    to_remove = existing_actors_ids - checked_actors
    to_add = checked_actors - existing_actors_ids
    remove_attrs = to_remove.map do |actor_to_remove|
      film_person = existing_film_actors.detect { |actor| actor.person_id.to_s == actor_to_remove }
      {
        id: film_person.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |actor_to_add|
      {
        person_id: actor_to_add,
        role: 'Actor'
      }
    end

    remove_attrs + add_attrs
  end

  def film_director_attributes
    directors = film_params[:directors_string].split(',').map(&:strip)
    checked_directors = directors.map do |person|
      Person.find_by(name: person)&.id
    end
    checked_directors = checked_directors.compact
    existing_film_directors = @film.film_people.where(role: 'Director')
    existing_directors_ids = existing_film_directors.map(&:person_id).map(&:to_s)
    to_remove = existing_directors_ids - checked_directors
    to_add = checked_directors - existing_directors_ids
    remove_attrs = to_remove.map do |director_to_remove|
      film_person = existing_film_directors.detect { |director| director.person_id.to_s == director_to_remove }
      {
        id: film_person.id,
        _destroy: true
      }
    end
    add_attrs = to_add.map do |director_to_add|
      {
        person_id: director_to_add,
        role: 'Director'
      }
    end

    remove_attrs + add_attrs
  end
end
