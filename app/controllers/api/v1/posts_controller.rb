class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :authenticate_user_from_api!, only: :show
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  #
  swagger_controller :posts, "test"
  swagger_api :index do
    summary "Fetches all User items"
    notes "This lists all the active users"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Team Id"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end
  swagger_api :show do
    summary "Fetches a single User item"
    param :path, :id, :integer, :optional, "User Id"
    response :ok, "Success", :User
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  #

  def index
    @posts = Post.all
  end


  def show
    @comment = Comment.new
  end

  # view 없는 것
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        render :show, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json { render :show, status: :ok, location: @post }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
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
