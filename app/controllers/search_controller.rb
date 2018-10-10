class SearchController < ApplicationController
  def search
  end

  def list
    if params[:query]
      @posts = Post.search(params[:query]).order("created_at DESC")
    end
  end
end
