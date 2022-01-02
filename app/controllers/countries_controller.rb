class CountriesController < ApplicationController
  def index
    @countries = policy_scope(Country.all)
  end

  def new
    @country = Country.new
    authorize(@country)
  end

  def create
    @country = Country.new(country_params)
    authorize(@country)

    if @genre.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
    authorize(@country)
  end

  def update
    @country = Country.find(params[:id])
    authorize(@country)

    if @genre.update(country_params)
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    redirect_to countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name, :banner)
  end
end
