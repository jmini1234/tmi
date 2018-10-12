class MypagesController < ApplicationController
  def index
  end

  def my
  end

  def bookmark
    @posts = Post.all
  end

  def notice
  end

  def setting
    @user = User.find(params[:id])
  end
end
