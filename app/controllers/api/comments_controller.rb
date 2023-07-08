class Api::CommentsController < ApplicationController
  def index
    post = Post.find_by(:id, params[:post_id])
    comments = post.comments

    render json: comments
  end

  def create
    post = Post.find_by(:id, params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      render json: comment, status: :created
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(author_id: @user.id, post_id: @post.id)
  end
end
