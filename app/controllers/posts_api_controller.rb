class Api::PostsController < ApplicationController
    before_action :set_post



    private

    def set_post
        @post = Post.find(params[:id])
        @comment = Comment.find(params[:id])
        @bookmark = Bookmark.find(params[:id])
    end

end