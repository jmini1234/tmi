if current_user
  json.user current_user
  json.bookmarks @bookmarks.each do |b|
    json.id b.post.id
    json.title b.post.title
    json.content b.post.content
    json.hashtag b.post.hashtag
    json.created_at b.post.created_at.to_s[5..9].gsub("-",".")
    json.author b.post.user.nickname
    json.comment_count b.post.comments.count
    bookmark = Bookmark.where(user_id: current_user.id, post_id: b.post_id).exists?
    json.bookmark bookmark
  end
else
  json.errorMessage "Authentication failed"
  json.errorCode "401"
end
