class FilmsController < ApplicationController
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

    redirect_to root_path
  end

  private

  def film_params
    params.require(:film).permit(:title, :description, :trailer_url, :release_date, :duration, :age_restriction,
                                 :creator_id)
  end
end
