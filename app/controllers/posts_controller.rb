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
    @user = User.find(@post.user_id)
    @comments = Comment.where("post_id = ?",@post.id)
    @comment = Comment.new
  end

  # view 없는 것

  def create
    @post = Post.new(post_params)
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status:
            :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status:
            :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :content, :hashtag, :user_id)
  end

end
