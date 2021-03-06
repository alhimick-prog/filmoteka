class TagsController < ApplicationController
  def index
    @tags = policy_scope(Tag.all)
    authorize(Tag.new)
  end

  def new
    @tag = Tag.new
    authorize(@tag)
  end

  def create
    @tag = Tag.new(tag_params)
    authorize(@tag)

    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    authorize(@tag)
  end

  def update
    @tag = Tag.find(params[:id])
    authorize(@tag)

    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    authorize(@tag)
    @tag.destroy!

    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
