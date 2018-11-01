json.user current_user
json.posts @posts.each do |p|
    json.id p.id
    json.title p.title
    json.content p.content
    json.hashtag p.hashtag
    json.created_at p.created_at.to_s[5..9].gsub("-",".")
    json.author p.user.nickname
    json.comment_count p.comments.count
    if current_user
        bookmark = Bookmark.where(user_id: current_user.id,post_id: p.id).exists?
        json.bookmark bookmark
    end
end
