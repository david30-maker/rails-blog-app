class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = @current_user
    @post = Post.find_by(id: params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    render :index
  end

  def show
    @user = @current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
    render :new
  end

  def create
    @user = @current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(author_id: @user.id, post_id: @post.id, text: params[:comment][:text])
    if @comment.save
      redirect_to user_post_comments_path(@user, @post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = @current_user
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to user_post_comments_path(@user, @post), notice: 'Comment successfully deleted.'
  end
end
