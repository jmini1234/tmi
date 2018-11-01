json.title @post.title
json.user_id @post.user_id
json.updated_at @post.updated_at
json.content @post.content
json.hashtag @post.hashtag
json.comment_number @post.comments.count
json.bookmark @bookmark
