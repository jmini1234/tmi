class SearchController < ApplicationController
  def search
  end

  def list
    @posts = Post.all
    if params[:query]
      @posts = Post.search(params[:query]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end
