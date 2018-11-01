json.user current_user

json.id @post.id
json.title @post.title
json.content @post.content
json.hashtag @post.hashtag
json.created_at @post.created_at.to_s[5..9].gsub("-",".")
json.author @post.user.nickname
json.comment_count @post.comments.count
    if current_user
        bookmark = Bookmark.where(user_id: current_user.id, post_id: @post.id).exists?
        json.bookmark bookmark
    end
json.posts @comments.each do |c|
    json.id c.id
    json.post_id c.post_id
    json.content c.content
    json.created_at c.created_at.to_s[5..9].gsub("-",".")
    json.author c.user.nickname
end
