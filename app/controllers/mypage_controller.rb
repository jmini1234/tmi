class MypageController < ApplicationController
  def my_post
    @posts = Post.all
  end

  def save_post
    @posts = Post.all
    @likes = Like.all
  end

  def new_news

  end

  def setting

  end
end
