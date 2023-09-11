class CommentsController < ApplicationController
  before_action :set_niu

  def index
    @comments = Comment.all
  end

  def show
    @comment = @niu.comments(params[:comment_id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.niu = @niu
    if comment.save
      render partial: 'show', locals: { comment: comment }, status: :ok
    else
      render partial: 'form', locals: { comment: comment }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:nius_user_id)
  end

  def set_niu
   @niu = Niu.find(params[:niu_id])
  end
end
