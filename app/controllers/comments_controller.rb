class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    authorize(@comment)
  end

  def create
    @comment = Comment.new(comment_params)
    authorize(@comment)

    @comment.save!
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize(@comment)
    @comment.destroy!

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
  end
end
