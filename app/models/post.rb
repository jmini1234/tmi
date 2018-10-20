class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :bookmarks

  def self.search(query)
<<<<<<< HEAD
    where("title LIKE ? OR content LIKE ? OR hashtag LIKE ?", "%#{query}%", "%#{query}%")
=======
    where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
>>>>>>> comment
  end
end
