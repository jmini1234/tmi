class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  # view 있는 것
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def show
    @comments = Comment.where("post_id = ?", @post.id)
    @comment = Comment.new
  end

  # view 없는 것

  def create
    @post = Post.new(post_params)
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def update
    @post.update(post_params)
    @post.saveredirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end


  private
  def set_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :content, :hashtag, :user_id)
  end

end