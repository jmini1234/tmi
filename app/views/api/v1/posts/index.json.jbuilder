json.array! @posts.each do |p|
    json.id p.id
    json.title p.title 
    json.content p.content
    json.created_at p.created_at.to_s[5..9].gsub("-",".")
    json.user_nickname p.user.nickname
    json.comment_count p.comments.count
    if current_user
        bookmark = Bookmark.where(user_id: current_user.id,post_id: p.id).exists?
        json.bookmark bookmark
    end
end
