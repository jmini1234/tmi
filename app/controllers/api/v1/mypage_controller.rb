class Api::V1::MypageController < Api::V1::ApplicationController

def my_post
  @posts = Post.where("user_id = ?", current_user.id)
end

def bookmark
  @bookmarks = Bookmark.where("user_id = ?", current_user.id)
end
def setting

end
end
