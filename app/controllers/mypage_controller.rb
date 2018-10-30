class MypageController < ApplicationController
  def my_post
    @posts = Post.where("user_id = ?", current_user.id)
  end

  def bookmark
    @bookmarks = Bookmark.where("user_id = ?", current_user.id)
  end

  def bookmark_create
    @bookmark = Bookmark.new
    @bookmark.post_id = params[:id]
    @bookmark.user_id = current_user.id
    @bookmark.save

    redirect_to :back
  end

  def bookmark_destroy
    @bookmark = Bookmark.find(params[:id]).destroy
    redirect_to '/'
  end

  def new_news

  end

  def setting

  end

  def test

  end
end
