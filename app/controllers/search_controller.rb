class SearchController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def list
    # @posts = Post.all
    @query = params[:query]
    if @query
      @posts = Post.search(params[:query]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end

  end
end
