class Api::PostsController < ApplicationController
    before_action :set_post

    def show
    end

    private

    def set_post
        @post = Post.find(params[:id])
        @bookmark = Bookmark.find(params[:id])
    end

end
