class MypageController < ApplicationController
  before_action :authenticate_user!

  def my_post
    @posts = Post.where("user_id = ?", current_user.id)
  end

  def bookmark
    @bookmarks = Bookmark.where("user_id = ?", current_user.id)
  end

  # def bookmark_create
  #   @bookmark = Bookmark.new
  #   @bookmark.post_id = params[:id]
  #   @bookmark.user_id = current_user.id
  #   @bookmark.save
  #
  #   redirect_to :back
  # end
  #
  # def bookmark_destroy
  #   @bookmark.destroy
  # end

  def new_news

  end

  def setting

  end

  def test

  end

  def bookmark_toggle
    like = Bookmark.find_by(user_id: current_user.id, post_id: params[:post_id])
     if like.nil?
        Bookmark.create(user_id: current_user.id, post_id: params[:post_id])
       else
         like.destroy
       end
       redirect_to :back
    end


end
