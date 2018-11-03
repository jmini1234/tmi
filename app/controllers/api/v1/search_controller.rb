class Api::V1::SearchController < Api::V1::ApplicationController
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
