class MypageController < ApplicationController
  def my_post
    @posts = Post.all
  end

  def bookmark
    @posts = Post.all
    @bookmarks = Bookmark.all

  end

  def new_news

  end

  def setting

  end

  def test

  end
end
