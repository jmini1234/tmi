class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :likes

  def self.search(query)
    where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
