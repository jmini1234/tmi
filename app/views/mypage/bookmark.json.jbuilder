json.user current_user
json.posts @bookmarks.each do |b|
    json.id b.id
    json.title b.title
    json.content b.content
    json.hashtag b.hashtag
    json.created_at b.created_at.to_s[5..9].gsub("-",".")
    json.author b.user.nickname
    json.comment_count b.comments.count
    if current_user
        bookmark = Bookmark.where(user_id: current_user.id,post_id: b.id).exists?
        json.bookmark bookmark
    end
end
