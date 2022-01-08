class PeopleController < ApplicationController
  def index
    @people = policy_scope(Person.all)
    authorize(Person.new)
  end

  def new
    @person = Person.new
    authorize(@person)
  end

  def create
    @person = Person.new(person_params)
    authorize(@person)

    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
    authorize(@person)
  end

  def update
    @person = Person.find(params[:id])
    authorize(@person)

    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:id])
    authorize(@person)
    @person.destroy!

    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:name, :birthday, :death_date)
  end
end
