json.title @post.title
json.content @post.content
json.user_id @post.user_id
json.updated_at @post.updated_at
json.comment_number @post.comments.count
json.bookmark @bookmark